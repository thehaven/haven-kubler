## haven/yt-dlp

Containerized yt-dlp with aria2 acceleration and an opinionated wrapper script at `/opt/scripts/yt-dlp.sh`.

Defaults favor playlist/file mode using `/media/channel_list.txt` and run in foreground for logs.

### Quick start (playlist mode – default)

1. Create a host directory and a `channel_list.txt` file with one URL per line:

    ```text
    https://www.youtube.com/@royalsociety/videos
    https://www.youtube.com/@GreatBigStory/videos
    ```

2. Run the container and mount your directory to `/media`:

    ```bash
    docker run --rm -it \
      -v /path/on/host:/media \
      haven/yt-dlp:latest
    ```

This will run `/opt/scripts/yt-dlp.sh --foreground` by default and read URLs from `/media/channel_list.txt`. By default it downloads items from the last 7 days; see env vars below to change this.

### One-shot mode (single URL)

Pass a URL via `--input-source` and enable `--oneshot` (downloads all unless you also set a date filter):

```bash
docker run --rm -it \
  -v /path/on/host:/media \
  haven/yt-dlp:latest \
  --oneshot --input-source "https://www.youtube.com/@royalsociety/videos"
```

### Environment variables (overrides)

All key runtime settings can be overridden via Docker env vars or CLI parameters:

| Environment Variable | CLI Parameter | Default Value | Example Values | Description |
|---------------------|---------------|---------------|----------------|-------------|
| `YTDLP_DOWNLOAD_DIR` | `--dir` | `/media` | `/srv/youtube`, `/downloads` | Download directory inside the container |
| `YTDLP_INPUT_SOURCE` | `--input-source` | `${YTDLP_DOWNLOAD_DIR}/channel_list.txt` | `/media/my_channels.txt`, `https://youtube.com/@user/videos` | File path or direct URL |
| `YTDLP_DAYS` | `--days` | `7` | `14`, `30`, `1` | Number of days to look back for downloads |
| `YTDLP_ONESHOT` | `--oneshot` | `false` | `true`, `false` | Enable one-shot URL mode (bypasses file reading) |
| `YTDLP_SUBTITLE_LANGS` | `--subtitle-langs` | `en` | `en,es`, `en,de,fr` | Comma-separated subtitle languages |
| `YTDLP_MIN_FREE_SPACE` | `--min-free-space` | `5` | `10`, `20` | Minimum free space required (GB) |
| `YTDLP_CODEC` | `--codec` | `mp4` | `mp4`, `vp9`, `av1` | Video codec preference with intelligent fallbacks |
| `YTDLP_FOREGROUND` | `--foreground` | `false` | `true`, `false` | Console logging vs. log file (container CMD uses `--foreground`) |
| `YTDLP_DEBUG` | `--debug` | `false` | `true`, `false` | Enable verbose yt-dlp output |
| `YTDLP_DRY_RUN` | `--dry-run` | `false` | `true`, `false` | Simulate downloads without downloading |
| `YTDLP_USER_AGENT` | _(built-in)_ | Chrome UA | `"Mozilla/5.0..."` | Custom User-Agent string |
| `YTDLP_PLAYLIST_END` | _(built-in)_ | `10` | `5`, `25`, `50` | Limit playlist items processed |
| `YTDLP_DOWNLOADER_ARGS` | _(built-in)_ | `aria2c:-c -j 3 -s 3 -x 3 -k 1M...` | `aria2c:-j 5 -x 5` | aria2c tuning parameters |
| `YTDLP_FORCE_IPV4` | _(built-in)_ | `true` | `true`, `false` | Force IPv4 connections |

Examples:

```bash
docker run --rm -it \
  -v /srv/youtube:/media \
  -e YTDLP_DAYS=14 \
  -e YTDLP_CODEC=vp9 \
  -e YTDLP_SUBTITLE_LANGS="en,es" \
  haven/yt-dlp:latest
```

AV1 example (CPU encode, WebM output):

```bash
docker run --rm -it \
  -v /srv/youtube:/media \
  -e YTDLP_CODEC=av1 \
  haven/yt-dlp:latest
```

### Choosing a codec (MP4/H.264 vs VP9 vs AV1)

You can select the preferred codec via `--codec {mp4|vp9|av1}` or `-e YTDLP_CODEC=...`. Each codec uses intelligent format strings with robust fallback chains to ensure successful downloads even when the preferred format isn't available.

| Option | Container | Video codec | Audio (typical) | HW decode support | 4K readiness | Compression efficiency | CPU decode cost | Compatibility | When to choose |
|---|---|---|---|---|---|---|---|---|---|
| mp4 | MP4 | H.264 (x264) | AAC (m4a) | Excellent (nearly universal) | Good | Lowest of the three | Lowest | Excellent (devices, TVs, editors) | Max compatibility, easiest playback/editing |
| vp9 | WebM | VP9 | Opus | Good on modern hardware (newer CPUs/GPUs) | Very good | ~30–50% better than H.264 | Medium | Good on modern players/browsers | Balance of quality and size, modern playback |
| av1 | WebM | AV1 (SVT-AV1 encode, dav1d decode) | Opus | Limited to newest GPUs/SoCs; software decode heavy | Excellent (4K/8K) | Best (often 20–30% better than VP9) | High | Best on latest players/browsers | Archival or bandwidth-sensitive use, modern environments |

Notes:

- Each codec option uses comprehensive format strings with multiple fallback paths to maximize download success
- Format selection is handled entirely by yt-dlp's format strings - no additional format sorting conflicts
- The image enables software H.264 encoding (x264) and AV1 encoding (SVT-AV1). VP9 is available (libvpx) if needed, but default output is MP4/H.264 unless `--codec` is set.
- Hardware acceleration is not enabled in this image; all encoding/decoding is CPU-only.
- YouTube doesn't serve MP3; typical audio is AAC (MP4) or Opus (WebM). No MP3 encoder is included.

### Volumes and permissions

- The image declares `VOLUME ["/media"]`. Mount your host directory there.
- Container runs as user `1000:1000` by default. Ensure the mounted host directory is writable by this UID/GID, or override at runtime:
  ```bash
  docker run --rm -it \
    --user $(id -u):$(id -g) \
    -v /path/on/host:/media \
    haven/yt-dlp:latest
  ```

### Cookies support (optional)

If a `cookies.txt` file exists at `${YTDLP_DOWNLOAD_DIR}/cookies.txt` (default `/media/cookies.txt`), it will be used automatically. This is useful for authenticated or age-restricted content.

### Output layout

Files are written under `${YTDLP_DOWNLOAD_DIR}` into folders by uploader and playlist, with metadata, description, info JSON, and embedded thumbnails/subtitles by default.

### Timezone

- Date filtering (via `YTDLP_DAYS`) uses the container timezone. Set it explicitly if you need a specific zone:

  ```bash
  docker run --rm -it \
    -e TZ=Europe/London \
    -v /path/on/host:/media \
    haven/yt-dlp:latest
  ```

### Shell Function Wrapper (Recommended)

For easier usage, you can add these functions to your `~/.bashrc` or `~/.zshrc`:

```bash
# yt-dlp Docker wrapper functions
YTDLP_VERSION="${YTDLP_VERSION:-latest}"
YTDLP_VOLUME_PATH="${YTDLP_VOLUME_PATH:-${HOME}/Downloads/Youtube}"
YTDLP_ENV_FILE="${YTDLP_ENV_FILE:-.env_yt-dlp}"

# Main function - passes all arguments through to the container
ytdlp() {
    local IMAGE="haven/yt-dlp:${YTDLP_VERSION}"
    
    # Pull latest and clean up
    docker pull "${IMAGE}"
    docker rm -f yt-dlp 2>/dev/null || true
    mkdir -p "${YTDLP_VOLUME_PATH}"

    # Run container with all arguments passed through
    docker run --rm -it \
        --name yt-dlp --hostname yt-dlp \
        -v "${YTDLP_VOLUME_PATH}:/media" \
        $([ -f "${YTDLP_ENV_FILE}" ] && echo "--env-file ${YTDLP_ENV_FILE}") \
        -e OPENSSL_CONF=/dev/null \
        --user=1000:1000 \
        --memory=2g --cpus=2 \
        --log-driver=json-file --log-opt max-size=10m \
        "${IMAGE}" "$@"
}

# One-shot download function
ytdlp-oneshot() {
    [ $# -eq 0 ] && { echo "Usage: ytdlp-oneshot <URL> [options]"; return 1; }
    ytdlp --oneshot --input-source "$1" "${@:2}"
}

# Playlist mode (reads from channel_list.txt)
ytdlp-playlist() {
    ytdlp "$@"  # Default behavior
}
```

**Usage examples:**
```bash
# One-shot downloads
ytdlp-oneshot "https://www.youtube.com/@royalsociety/videos"
ytdlp-oneshot "https://www.youtube.com/@royalsociety/videos" --days 14 --codec vp9

# Playlist mode (needs channel_list.txt in your volume path)
ytdlp-playlist --days 30 --codec av1

# Direct usage with any parameters
ytdlp --oneshot --input-source "https://youtube.com/watch?v=abc123" --debug
ytdlp --help
```

### Notes

- By default the script filters to the last `YTDLP_DAYS` days in playlist mode. Set a different value with `-e YTDLP_DAYS=30` or disable date filtering by using `--oneshot` for direct URLs.
- The image includes a healthcheck that validates the presence of `/opt/scripts/yt-dlp.sh`, `yt-dlp` on PATH, and writability of `/media`.

[Last Build][packages]

[yt-dlp]: https://github.com/yt-dlp/yt-dlp
[packages]: PACKAGES.md
