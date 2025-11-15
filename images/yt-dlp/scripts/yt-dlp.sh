#!/usr/bin/env bash

#
# Module Name: yt-dlp.sh
# Author: Haven (Updated 2025.10.24)
# Version: 1.3.0
# Purpose: Automated YouTube channel downloader wrapper for yt-dlp with aria2c acceleration
# Usage: ./yt-dlp.sh [OPTIONS]
#

# Enable strict mode
set -euo pipefail

# Color output control (respects NO_COLOR env var)
if [[ -z "${NO_COLOR:-}" ]] && [[ -t 1 ]]; then
    COLOR_BOLD_CYAN="\033[1;36m"
    COLOR_GREEN="\033[0;32m"
    COLOR_YELLOW="\033[0;33m"
    COLOR_RED="\033[0;31m"
    COLOR_CYAN="\033[0;36m"
    COLOR_RESET="\033[0m"
else
    COLOR_BOLD_CYAN=""
    COLOR_GREEN=""
    COLOR_YELLOW=""
    COLOR_RED=""
    COLOR_CYAN=""
    COLOR_RESET=""
fi

# Quick version/help/list-channels check before dependencies (no deps required for these)
if [[ "${1:-}" == "--version" ]] || [[ "${1:-}" == "-v" ]]; then
    echo "${COLOR_CYAN}yt-dlp.sh${COLOR_RESET} version ${COLOR_GREEN}1.3.0${COLOR_RESET}"
    exit 0
fi

# Quick list-channels check (scan all args for --list-channels before dependency check)
for arg in "$@"; do
    if [[ "$arg" == "--list-channels" ]]; then
        # Find --input-source value
        INPUT_FILE=""
        while [[ $# -gt 0 ]]; do
            if [[ "$1" == "--input-source" ]] && [[ -n "${2:-}" ]]; then
                INPUT_FILE="$2"
                break
            fi
            shift
        done
        
        # Use default if not specified
        if [[ -z "$INPUT_FILE" ]]; then
            INPUT_FILE="/media/channel_list.txt"
        fi
        
        if [[ ! -f "$INPUT_FILE" ]]; then
            echo -e "${COLOR_RED}Error:${COLOR_RESET} Input file not found: $INPUT_FILE" >&2
            exit 2
        fi
        
        echo -e "${COLOR_BOLD_CYAN}Channels in $INPUT_FILE:${COLOR_RESET}"
        echo ""
        count=1
        while IFS= read -r line || [[ -n "$line" ]]; do
            # Skip empty lines and comments
            if [[ -n "$line" ]] && [[ ! "$line" =~ ^[[:space:]]*# ]]; then
                echo -e "  ${COLOR_GREEN}${count}.${COLOR_RESET} ${line}"
                ((count++))
            fi
        done < "$INPUT_FILE"
        echo ""
        echo -e "${COLOR_CYAN}Total channels: $((count - 1))${COLOR_RESET}"
        exit 0
    fi
done

# Define the usage/help function (before early checks so they can call it)
usage() {
  echo -e "${COLOR_BOLD_CYAN}Usage:${COLOR_RESET} $(basename "$0") [OPTIONS]"
  echo ""
  echo -e "${COLOR_BOLD_CYAN}Options:${COLOR_RESET}"
  echo -e "  ${COLOR_GREEN}-h, --help${COLOR_RESET}         Display this help message"
  echo -e "  ${COLOR_GREEN}--days${COLOR_RESET}             Specify the number of days to download videos from (default: 7)"
  echo -e "  ${COLOR_GREEN}--dir${COLOR_RESET}              Specify the download directory (default: /media)"
  echo -e "  ${COLOR_GREEN}--input-source${COLOR_RESET}     Specify the input source (file or URL) containing the channel list (default: /media/channel_list.txt)"
  echo -e "  ${COLOR_GREEN}--oneshot${COLOR_RESET}          Download all videos without date filtering"
  echo -e "  ${COLOR_GREEN}--foreground${COLOR_RESET}       Run in foreground with console output (no log file redirection)"
  echo -e "  ${COLOR_GREEN}--debug${COLOR_RESET}            Enable debug mode with verbose output"
  echo -e "  ${COLOR_GREEN}--dry-run${COLOR_RESET}          Show what would be downloaded without actually downloading"
  echo -e "  ${COLOR_GREEN}--subtitle-langs${COLOR_RESET}   Comma-separated list of subtitle languages (default: en)"
  echo -e "  ${COLOR_GREEN}--min-free-space${COLOR_RESET}   Minimum free space required in GB (default: 5)"
  echo -e "  ${COLOR_GREEN}--codec${COLOR_RESET}            Video codec preference: h264, vp9, or av1 (default: av1)"
  echo -e "  ${COLOR_GREEN}--playlist-end${COLOR_RESET}     Maximum number of videos to download from playlist (default: 10, unlimited in oneshot mode)"
  echo -e "  ${COLOR_GREEN}--list-channels${COLOR_RESET}    Display channels from input file without downloading"
  echo ""
  echo -e "${COLOR_BOLD_CYAN}Examples:${COLOR_RESET}"
  echo -e "  ${COLOR_YELLOW}# Download all videos from a single channel${COLOR_RESET}"
  echo -e "  $(basename "$0") --oneshot --input-source https://www.youtube.com/@example/videos"
  echo ""
  echo -e "  ${COLOR_YELLOW}# Download last 7 days from channel list${COLOR_RESET}"
  echo -e "  $(basename "$0") --days 7 --input-source /media/channel_list.txt"
  echo ""
  echo -e "  ${COLOR_YELLOW}# Test run without downloading (dry-run)${COLOR_RESET}"
  echo -e "  $(basename "$0") --dry-run --oneshot --input-source https://www.youtube.com/@example/videos"
  echo ""
  echo -e "  ${COLOR_YELLOW}# Limit oneshot to first 50 videos${COLOR_RESET}"
  echo -e "  $(basename "$0") --oneshot --playlist-end 50 --input-source https://www.youtube.com/@example/videos"
  echo ""
  echo -e "  ${COLOR_YELLOW}# List channels from file without downloading${COLOR_RESET}"
  echo -e "  $(basename "$0") --list-channels --input-source /media/channel_list.txt"
  exit 0
}

# Early help check (works without dependencies)
if [[ "${1:-}" == "--help" ]] || [[ "${1:-}" == "-h" ]]; then
    usage
fi

# Default configuration values (overrideable by Docker environment variables)
DOWNLOAD_DIR_DEFAULT=${YTDLP_DOWNLOAD_DIR:-'/media'}
INPUT_SOURCE_DEFAULT=${YTDLP_INPUT_SOURCE:-"${DOWNLOAD_DIR_DEFAULT}/channel_list.txt"}
DAYS_DEFAULT=${YTDLP_DAYS:-7}
SUBTITLE_LANGS_DEFAULT=${YTDLP_SUBTITLE_LANGS:-'en'}
MIN_FREE_SPACE_DEFAULT=${YTDLP_MIN_FREE_SPACE:-5}
CODEC_DEFAULT=${YTDLP_CODEC:-'av1'}
PLAYLIST_END_DEFAULT=10
PLAYLIST_END=${YTDLP_PLAYLIST_END:-$PLAYLIST_END_DEFAULT}
DOWNLOADER_ARGS=${YTDLP_DOWNLOADER_ARGS:-'aria2c:-c -j 1 -s 6 -x 6 -k 1M --max-concurrent-downloads=1 --log-level=warn --file-allocation=none'}
FORCE_IPV4=${YTDLP_FORCE_IPV4:-true}
LOG_DIR_DEFAULT=${YTDLP_LOG_DIR:-"/tmp/$(basename "$0")"}
USER_AGENT=${YTDLP_USER_AGENT:-'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'}

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
PLAYLIST_END_SPECIFIED=false
FOREGROUND=${YTDLP_FOREGROUND:-false}
DEBUG=${YTDLP_DEBUG:-false}
DRY_RUN=${YTDLP_DRY_RUN:-false}
LIST_CHANNELS=${YTDLP_LIST_CHANNELS:-false}
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
    --playlist-end)
      PLAYLIST_END=$2
      PLAYLIST_END_SPECIFIED=true
      shift 2
      ;;
    --version|-v)
      echo -e "${COLOR_CYAN}$(basename "$0")${COLOR_RESET} version ${COLOR_GREEN}1.3.0${COLOR_RESET}"
      exit 0
      ;;
    --list-channels)
      LIST_CHANNELS=true
      shift 1
      ;;
    --help|-h)
      usage
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

# Validate numeric inputs (use safe parameter expansion to handle unset variables)
if [[ -n "${DAYS:-}" ]] && ! [[ "${DAYS:-}" =~ ^[0-9]+$ ]]; then
    echo -e "${COLOR_RED}Error:${COLOR_RESET} --days must be a positive integer, got: ${DAYS:-}" >&2
    exit 2
fi

if [[ -n "${MIN_FREE_SPACE:-}" ]] && ! [[ "${MIN_FREE_SPACE:-}" =~ ^[0-9]+$ ]]; then
    echo -e "${COLOR_RED}Error:${COLOR_RESET} --min-free-space must be a positive integer (GB), got: ${MIN_FREE_SPACE:-}" >&2
    exit 2
fi

if [[ -n "${PLAYLIST_END:-}" ]] && ! [[ "${PLAYLIST_END:-}" =~ ^[0-9]+$ ]]; then
    echo -e "${COLOR_RED}Error:${COLOR_RESET} --playlist-end must be a positive integer, got: ${PLAYLIST_END:-}" >&2
    exit 2
fi

# Set default values if not provided
DOWNLOAD_DIR=${DOWNLOAD_DIR:-$DOWNLOAD_DIR_DEFAULT}
INPUT_SOURCE=${INPUT_SOURCE:-$INPUT_SOURCE_DEFAULT}
DAYS=${DAYS:-$DAYS_DEFAULT}
SUBTITLE_LANGS=${SUBTITLE_LANGS:-$SUBTITLE_LANGS_DEFAULT}
MIN_FREE_SPACE=${MIN_FREE_SPACE:-$MIN_FREE_SPACE_DEFAULT}
CODEC=${CODEC:-$CODEC_DEFAULT}

# Set PLAYLIST_END default based on oneshot mode
if [ "$ONESHOT" = true ] && [ "$PLAYLIST_END_SPECIFIED" = false ]; then
    # Oneshot mode without explicit --playlist-end: unlimited
    PLAYLIST_END=""
else
    # Normal mode or explicit --playlist-end: use default or specified value
    PLAYLIST_END=${PLAYLIST_END:-$PLAYLIST_END_DEFAULT}
fi


# If running in default playlist mode, require the default channel list file to exist
if [ "$ONESHOT" = false ]; then
    if [ "${INPUT_SOURCE}" = "${DOWNLOAD_DIR}/channel_list.txt" ] && [ ! -f "${INPUT_SOURCE}" ]; then
        echo -e "${COLOR_RED}Error:${COLOR_RESET} Playlist mode selected but input file not found at: ${INPUT_SOURCE}" >&2
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

# Check if the script is already running (flock-based with fallback)
LOCK_FILE="/tmp/$(basename "$0").lock"

if command -v flock >/dev/null 2>&1; then
    # Use flock for atomic locking (Linux/Homebrew on macOS)
    exec 200>"$LOCK_FILE"
    if ! flock -n 200; then
        echo -e "${COLOR_RED}Error:${COLOR_RESET} Another instance of this script is already running" >&2
        echo "Lock file: $LOCK_FILE" >&2
        exit 1
    fi
    # Lock acquired - will be released on script exit
    echo -e "${COLOR_GREEN}✓${COLOR_RESET} Acquired exclusive lock"
else
    # Fallback to pgrep (less reliable but cross-platform)
    script_path="$(realpath "$0")"
    if pgrep -f "$script_path" | grep -v $$ >/dev/null; then
        echo -e "${COLOR_RED}Error:${COLOR_RESET} An instance of this script is already running" >&2
        echo "(Install 'flock' for better locking)" >&2
        exit 1
    fi
fi

# Enable debug mode if requested
if [ "$DEBUG" = true ]; then
    echo -e "${COLOR_YELLOW}Debug mode enabled${COLOR_RESET}"
    set -x  # Enable bash debug tracing
fi

# Create log directory and redirect output unless in foreground mode
if [ "$FOREGROUND" = false ]; then
    LOG_DIR=${LOG_DIR_DEFAULT}
    mkdir -p "${LOG_DIR}" || {
        echo -e "${COLOR_RED}Error:${COLOR_RESET} Cannot create log directory: ${LOG_DIR}" >&2
        exit 1
    }
    LOG_FILE="${LOG_DIR}/yt-dlp-$(date +%Y%m%d-%H%M%S).log"
    exec > >(tee -a "${LOG_FILE}") 2>&1
    echo -e "${COLOR_CYAN}Logging to: ${LOG_FILE}${COLOR_RESET}"
else
    echo -e "${COLOR_CYAN}Running in foreground mode - output to console${COLOR_RESET}"
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
    
    if (( available_space < min_space_gb )); then
        echo -e "${COLOR_RED}Error:${COLOR_RESET} Insufficient disk space in ${dir}" >&2
        echo "Available: ${available_space}GB, Required: ${min_space_gb}GB" >&2
        exit 1
    else
        echo -e "${COLOR_GREEN}✓${COLOR_RESET} Disk space check passed: ${available_space}GB available (minimum: ${min_space_gb}GB)"
    fi
}

# Perform disk space check
check_disk_space "${DOWNLOAD_DIR}" "${MIN_FREE_SPACE}"

# Validate codec choice
if [[ "$CODEC" != "h264" && "$CODEC" != "vp9" && "$CODEC" != "av1" ]]; then
    echo -e "${COLOR_RED}Error:${COLOR_RESET} Invalid codec '$CODEC'. Must be 'h264', 'vp9', or 'av1'" >&2
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
            echo "Error: Unknown codec: $1" >&2
            exit 1
            ;;
    esac
}

# Get the format string based on codec choice
FORMAT_STRING=$(get_format_string "$CODEC")
echo -e "${COLOR_CYAN}Using codec:${COLOR_RESET} $CODEC"
echo -e "${COLOR_CYAN}Format string:${COLOR_RESET} $FORMAT_STRING"

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

# Add playlist-end option if set (not empty)
if [ -n "${PLAYLIST_END}" ]; then
    COMMON_OPTIONS+=(--playlist-end="${PLAYLIST_END}")
fi

# Add cookies if file exists
if [ -f "${DOWNLOAD_DIR}/cookies.txt" ]; then
    COMMON_OPTIONS+=(--cookies="${DOWNLOAD_DIR}/cookies.txt")
fi

# Add debug verbosity if requested (overrides --no-warnings)
if [ "$DEBUG" = true ]; then
    echo -e "${COLOR_YELLOW}Debug mode:${COLOR_RESET} enabling verbose yt-dlp output"
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
    echo -e "${COLOR_YELLOW}Dry-run mode enabled:${COLOR_RESET} no files will be downloaded"
    COMMON_OPTIONS+=(--simulate)
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
        echo "Oneshot mode: downloading from URL with date filter"
    else
        echo "Oneshot mode: downloading all available videos from URL"
    fi
fi

# Determine if INPUT_SOURCE is a file or a URL
if [ -f "$INPUT_SOURCE" ]; then
  # If INPUT_SOURCE is a file, read URLs from the file
  # First, count total channels for progress tracking
  total_channels=0
  while IFS= read -r line; do
    if [[ -n "$line" ]] && [[ ! "$line" =~ ^[[:space:]]*# ]]; then
      total_channels=$((total_channels + 1))
    fi
  done < "$INPUT_SOURCE"
  
  echo -e "${COLOR_CYAN}Processing ${total_channels} channel(s) from file${COLOR_RESET}"
  echo ""
  
  # Now process each channel with progress counter
  current_channel=0
  while IFS= read -r line; do
    # Skip empty lines and comments
    if [[ -n "$line" ]] && [[ ! "$line" =~ ^[[:space:]]*# ]]; then
      current_channel=$((current_channel + 1))
      
      echo -e "${COLOR_BOLD_CYAN}[${current_channel}/${total_channels}]${COLOR_RESET} Processing channel: ${line}"
      
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
      
      echo ""
    fi
  done < "$INPUT_SOURCE"
  
  echo -e "${COLOR_GREEN}✓${COLOR_RESET} Completed processing ${total_channels} channel(s)"
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
