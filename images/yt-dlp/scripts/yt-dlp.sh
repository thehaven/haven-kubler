#!/bin/bash

#
# Module Name: yt-dlp.sh
# Author: Haven (Updated 2025.09.25)
# Version: 1.1.0
# Purpose: Automated YouTube channel downloader wrapper for yt-dlp with aria2c acceleration
# Usage: ./yt-dlp.sh [OPTIONS]
#

# Enable strict mode
set -euo pipefail

# Define the help function
help() {
  echo "Usage: $(basename "$0") [OPTIONS]"
  echo "Options:"
  echo "  -h, --help         Display this help message"
  echo "  --days             Specify the number of days to download videos from (default: 7)"
  echo "  --dir              Specify the download directory (default: /media)"
  echo "  --input-source     Specify the input source (file or URL) containing the channel list (default: /media/channel_list.txt)"
  echo "  --oneshot          Download all videos without date filtering"
  echo "  --foreground       Run in foreground with console output (no log file redirection)"
  echo "  --debug            Enable debug mode with verbose output"
  echo "  --dry-run          Show what would be downloaded without actually downloading"
  echo "  --subtitle-langs   Comma-separated list of subtitle languages (default: en)"
  echo "  --min-free-space   Minimum free space required in GB (default: 5)"
  echo "  --codec            Video codec preference: h264, vp9, or av1 (default: h264)"
  echo ""
  echo "Examples:"
  echo "  $(basename "$0") --oneshot --dir /media/KidsYoutube --input-source https://www.youtube.com/@royalsociety/videos"
  echo "  $(basename "$0") --codec vp9 --days 7 --input-source /media/channel_list.txt"
  exit 0
}

# Default configuration values (overrideable by Docker environment variables)
DOWNLOAD_DIR_DEFAULT=${YTDLP_DOWNLOAD_DIR:-'/media'}
INPUT_SOURCE_DEFAULT=${YTDLP_INPUT_SOURCE:-"${DOWNLOAD_DIR_DEFAULT}/channel_list.txt"}
DAYS_DEFAULT=${YTDLP_DAYS:-7}
SUBTITLE_LANGS_DEFAULT=${YTDLP_SUBTITLE_LANGS:-'en'}
MIN_FREE_SPACE_DEFAULT=${YTDLP_MIN_FREE_SPACE:-5}
CODEC_DEFAULT=${YTDLP_CODEC:-'av1'}

# Additional defaults (env-overridable)
USER_AGENT=${YTDLP_USER_AGENT:-'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36'}
PLAYLIST_END=${YTDLP_PLAYLIST_END:-10}
DOWNLOADER_ARGS=${YTDLP_DOWNLOADER_ARGS:-'aria2c:-c -j 1 -s 1 -x 1 --max-concurrent-downloads=1 --log-level=warn --file-allocation=none'}
FORCE_IPV4=${YTDLP_FORCE_IPV4:-true}

# Check dependencies
for cmd in yt-dlp aria2c ffmpeg; do
    if ! command -v "$cmd" >/dev/null 2>&1; then
        echo "Error: $cmd not found. Please install it." >&2
        exit 1
    fi
done

# Find yt-dlp path
YT_DLP_PATH="$(command -v yt-dlp)"

# Parse long options
ONESHOT=${YTDLP_ONESHOT:-false}
DAYS_SPECIFIED=false
FOREGROUND=${YTDLP_FOREGROUND:-false}
DEBUG=${YTDLP_DEBUG:-false}
DRY_RUN=${YTDLP_DRY_RUN:-false}
while [ $# -gt 0 ]; do
  case $1 in
    --days)
      DAYS=$2
      DAYS_SPECIFIED=true
      shift 2
      ;;
    --dir)
      DOWNLOAD_DIR=$2
      shift 2
      ;;
    --input-source)
      INPUT_SOURCE=$2
      shift 2
      ;;
    --oneshot)
      ONESHOT=true
      shift 1
      ;;
    --foreground)
      FOREGROUND=true
      shift 1
      ;;
    --debug)
      DEBUG=true
      shift 1
      ;;
    --dry-run)
      DRY_RUN=true
      shift 1
      ;;
    --subtitle-langs)
      SUBTITLE_LANGS=$2
      shift 2
      ;;
    --min-free-space)
      MIN_FREE_SPACE=$2
      shift 2
      ;;
    --codec)
      CODEC=$2
      shift 2
      ;;
    --help|-h)
      help
      ;;
    *)
      echo "Unknown option: $1"
      exit 1
      ;;
  esac
done

# Check if both --oneshot and --days are specified
if [ "$ONESHOT" = true ] && [ "$DAYS_SPECIFIED" = true ]; then
  echo "Error: Cannot specify both --oneshot and --days options."
  exit 1
fi

# Set default values if not provided
DOWNLOAD_DIR=${DOWNLOAD_DIR:-$DOWNLOAD_DIR_DEFAULT}
INPUT_SOURCE=${INPUT_SOURCE:-$INPUT_SOURCE_DEFAULT}
DAYS=${DAYS:-$DAYS_DEFAULT}
SUBTITLE_LANGS=${SUBTITLE_LANGS:-$SUBTITLE_LANGS_DEFAULT}
MIN_FREE_SPACE=${MIN_FREE_SPACE:-$MIN_FREE_SPACE_DEFAULT}
CODEC=${CODEC:-$CODEC_DEFAULT}

# If running in default playlist mode, require the default channel list file to exist
if [ "$ONESHOT" = false ]; then
    if [ "${INPUT_SOURCE}" = "${DOWNLOAD_DIR}/channel_list.txt" ] && [ ! -f "${INPUT_SOURCE}" ]; then
        echo "Error: Playlist mode selected but input file not found at: ${INPUT_SOURCE}" >&2
        echo "Create ${INPUT_SOURCE} with one URL per line, or override via:\n  -e YTDLP_INPUT_SOURCE=</path/to/file> or --input-source <file|URL>,\n  or use --oneshot for direct URLs." >&2
        exit 2
    fi
fi

# Calculate the date based on the number of days
if [ "$ONESHOT" = false ]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        DATE="--dateafter=$(date -v-"${DAYS}"d '+%Y%m%d')"
    else
        # Linux and other Unix systems
        DATE="--dateafter=$(date --date="${DAYS} days ago" '+%Y%m%d')"
    fi
fi

# Check if the script is already running
script_path="$(realpath "$0")"
if pgrep -f "$script_path" | grep -v $$ >/dev/null; then
  echo "An instance of this script is already running, exiting."
  exit 1
fi

# Enable debug mode if requested
if [ "$DEBUG" = true ]; then
    echo "Debug mode enabled"
    set -x  # Enable bash debug tracing
fi

# Create log directory and redirect output unless in foreground mode
if [ "$FOREGROUND" = false ]; then
    LOG_DIR="/tmp/$(basename "$0")"
    LOG_FILE="${LOG_DIR}/$(date +"%Y%m%d-%H%M%S").log"
    mkdir -p "${LOG_DIR}"
    echo "Logging to: ${LOG_FILE}"
    # Redirect output and errors to a log file
    exec > "${LOG_FILE}" 2>&1
else
    echo "Running in foreground mode - output to console"
fi

# Output directory creation with error handling
if ! mkdir -p "${DOWNLOAD_DIR}"; then
    echo "Error: Cannot create download directory: ${DOWNLOAD_DIR}" >&2
    exit 1
fi

# Check write permissions on download directory
if [ ! -w "${DOWNLOAD_DIR}" ]; then
    echo "Error: No write permissions for directory: ${DOWNLOAD_DIR}" >&2
    exit 1
fi

# Check available disk space (cross-platform)
check_disk_space() {
    local dir="$1"
    local min_space_gb="$2"
    local available_space
    
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS: df output in 512-byte blocks
        available_space=$(df "$dir" | tail -1 | awk '{print $4}')
        available_space=$((available_space / 2048 / 1024))  # Convert to GB
    else
        # Linux: df output in 1K blocks with --block-size=1G
        available_space=$(df --block-size=1G "$dir" | tail -1 | awk '{print $4}' | sed 's/G//')
    fi
    
    if [ "$available_space" -lt "$min_space_gb" ]; then
        echo "Error: Insufficient disk space. Available: ${available_space}GB, Required: ${min_space_gb}GB" >&2
        exit 1
    else
        echo "Disk space check passed: ${available_space}GB available (minimum: ${min_space_gb}GB)"
    fi
}

# Perform disk space check
check_disk_space "${DOWNLOAD_DIR}" "${MIN_FREE_SPACE}"

# Validate codec choice
if [[ "$CODEC" != "h264" && "$CODEC" != "vp9" && "$CODEC" != "av1" ]]; then
    echo "Error: Invalid codec '$CODEC'. Must be 'h264', 'vp9', or 'av1'" >&2
    exit 1
fi

# Define format strings for different codecs
get_format_string() {
    case "$1" in
        "h264")
            echo 'bestvideo[vcodec^=avc1]+bestaudio[ext=m4a]/bestvideo[vcodec^=avc1]+bestaudio/best[vcodec^=avc1]/best'
            ;;
        "vp9")
            # MP4-first strategy: prefer VP9 in MP4 with AAC audio, fallback to any VP9
            echo 'bestvideo[vcodec^=vp09]+bestaudio[ext=m4a]/bestvideo[vcodec^=vp09]+bestaudio/best[vcodec^=vp09]/best'
            ;;
        "av1")
            # MP4-first strategy: prefer AV1 in MP4 with AAC audio, fallback to any AV1  
            echo 'bestvideo[vcodec^=av01]+bestaudio[ext=m4a]/bestvideo[vcodec^=av01]+bestaudio/best[vcodec^=av01]/best'
            ;;
        *)
            echo "Error: Unknown codec: $codec" >&2
            exit 1
            ;;
    esac
}

# Get the format string based on codec choice
FORMAT_STRING=$(get_format_string "$CODEC")
echo "Using codec: $CODEC with format: $FORMAT_STRING"

# Define common yt-dlp options as an array
# DOWNLOADER_ARGS may be overridden via YTDLP_DOWNLOADER_ARGS env var
COMMON_OPTIONS=(
  --sponsorblock-mark=all
  --sponsorblock-remove=sponsor
  --playlist-reverse
  --match-filter='!is_live & availability!=premium_only & availability!=subscriber_only'
  --downloader=aria2c
  --downloader-args="${DOWNLOADER_ARGS}"
  --download-archive="${DOWNLOAD_DIR}/downloaded.txt"
  --http-chunk-size=10M
  -c
  --playlist-end="${PLAYLIST_END}"
  --user-agent="${USER_AGENT}"
  --ignore-errors
  --no-warnings
  --output="${DOWNLOAD_DIR}/%(uploader)s: %(playlist_title)s [%(playlist_id)s]/%(playlist)s - S%(release_date>%Y,upload_date>%Y|01)s E%(release_date>%y%m%d,upload_date>%y%m%d,playlist_index)s - %(title)s [%(id)s].%(ext)s"
  -f "$FORMAT_STRING"
  --embed-thumbnail
  --embed-subs
  --write-subs
  --sub-langs="${SUBTITLE_LANGS}"
  --write-auto-subs
  --add-metadata
  --write-thumbnail
  --write-info-json
  --write-description
)

# Optionally enforce IPv4 based on env setting
if [ "$FORCE_IPV4" = true ]; then
    COMMON_OPTIONS+=(--force-ipv4)
fi

# Add cookies if file exists
if [ -f "${DOWNLOAD_DIR}/cookies.txt" ]; then
    COMMON_OPTIONS+=(--cookies="${DOWNLOAD_DIR}/cookies.txt")
fi

# Add codec-specific options to COMMON_OPTIONS
#if [ "$CODEC" = "h264" ]; then
#    COMMON_OPTIONS+=(--format-sort="ext,vcodec:h264,acodec,quality,res,fps")
#    COMMON_OPTIONS+=(--merge-output-format=mp4)
#elif [ "$CODEC" = "vp9" ]; then
#    COMMON_OPTIONS+=(--format-sort="ext,vcodec:vp9,acodec,quality,res,fps")
#    COMMON_OPTIONS+=(--merge-output-format=webm)
#else
#    COMMON_OPTIONS+=(--format-sort="ext,vcodec:av01,acodec,quality,res,fps")
#    COMMON_OPTIONS+=(--merge-output-format=webm)
#fi

# Add debug verbosity if requested (overrides --no-warnings)
if [ "$DEBUG" = true ]; then
    echo "Debug mode: enabling verbose yt-dlp output"
    COMMON_OPTIONS+=(--verbose)
    # Remove --no-warnings for debug mode
    for i in "${!COMMON_OPTIONS[@]}"; do
        if [[ "${COMMON_OPTIONS[i]}" == "--no-warnings" ]]; then
            unset 'COMMON_OPTIONS[i]'
        fi
    done
    # Rebuild array to remove gaps
    COMMON_OPTIONS=("${COMMON_OPTIONS[@]}")
fi

# Add dry-run option if requested
if [ "$DRY_RUN" = true ]; then
    echo "Dry-run mode: showing what would be downloaded"
    COMMON_OPTIONS+=(--simulate --print-json)
fi

# Safety check for --oneshot flag
if [ "$ONESHOT" = true ]; then
    # Prevent --oneshot from being used with files - must be a direct URL
    if [ -f "$INPUT_SOURCE" ]; then
        echo "Error: --oneshot requires a direct YouTube URL, not a file." >&2
        exit 1
    fi
    
    # Verify it's a YouTube URL
    if [[ ! "$INPUT_SOURCE" =~ youtube\.com|youtu\.be ]]; then
        echo "Error: --oneshot requires a YouTube URL." >&2
        exit 1
    fi
    
    if [ -n "${DATE:-}" ]; then
        echo "Oneshot mode: downloading from URL with ${DAYS}-day filter"
    else
        echo "Oneshot mode: downloading all available videos from URL"
    fi
fi

# Determine if INPUT_SOURCE is a file or a URL
if [ -f "$INPUT_SOURCE" ]; then
  # If INPUT_SOURCE is a file, read URLs from the file
  while IFS= read -r line; do
    if [ -n "$line" ]; then
      if [ "$DRY_RUN" = true ]; then
        echo "--- Would download: $line ---"
      else
        echo "--- Downloading $line ---"
      fi
      if [ -n "${DATE:-}" ]; then
        "$YT_DLP_PATH" "${COMMON_OPTIONS[@]}" "$DATE" "${line}"
      else
        "$YT_DLP_PATH" "${COMMON_OPTIONS[@]}" "${line}"
      fi
    fi
  done < "$INPUT_SOURCE"
else
  # If INPUT_SOURCE is a URL, download it directly
  if [ "$DRY_RUN" = true ]; then
    echo "--- Would download: $INPUT_SOURCE ---"
  else
    echo "--- Downloading $INPUT_SOURCE ---"
  fi
  # Apply date filter (works for both regular and oneshot modes)
  if [ -n "${DATE:-}" ]; then
    "$YT_DLP_PATH" "${COMMON_OPTIONS[@]}" "$DATE" "${INPUT_SOURCE}"
  else
    "$YT_DLP_PATH" "${COMMON_OPTIONS[@]}" "${INPUT_SOURCE}"
  fi
fi
