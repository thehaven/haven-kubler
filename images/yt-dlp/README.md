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

All key runtime settings can be overridden via Docker env vars.

- **YTDLP_DOWNLOAD_DIR**: Download directory inside the container. Default: `/media`
- **YTDLP_INPUT_SOURCE**: File path or URL. Default: `"${YTDLP_DOWNLOAD_DIR}/channel_list.txt"`
- **YTDLP_DAYS**: Integer number of days to look back. Default: `7`
- **YTDLP_ONESHOT**: `true|false` to enable one-shot URL mode. Default: `false`
- **YTDLP_SUBTITLE_LANGS**: Comma-separated subtitle languages. Default: `en`
- **YTDLP_MIN_FREE_SPACE**: Minimum free space required (GB). Default: `5`
- **YTDLP_CODEC**: `mp4|vp9|av1` with intelligent fallbacks. Default: `mp4`
- **YTDLP_FOREGROUND**: `true|false` console logging vs. log file. Default: `false` in script, but container CMD uses `--foreground`
- **YTDLP_DEBUG**: `true|false` adds verbose yt-dlp output. Default: `false`
- **YTDLP_DRY_RUN**: `true|false` simulate downloads. Default: `false`
- **YTDLP_USER_AGENT**: Custom User-Agent string. Default: Chrome UA
- **YTDLP_PLAYLIST_END**: Limit playlist items processed. Default: `10`
- **YTDLP_DOWNLOADER_ARGS**: aria2c tuning string. Default: `aria2c:-c -j 3 -s 3 -x 3 -k 1M --max-concurrent-downloads=1 --log-level=warn --file-allocation=none`
- **YTDLP_FORCE_IPV4**: `true|false` to add `--force-ipv4`. Default: `true`

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

You can select the preferred codec via `--codec {mp4|vp9|av1}` or `-e YTDLP_CODEC=...`. The script will fall back smartly when the exact choice is not available.

| Option | Container | Video codec | Audio (typical) | HW decode support | 4K readiness | Compression efficiency | CPU decode cost | Compatibility | When to choose |
|---|---|---|---|---|---|---|---|---|---|
| mp4 | MP4 | H.264 (x264) | AAC (m4a) | Excellent (nearly universal) | Good | Lowest of the three | Lowest | Excellent (devices, TVs, editors) | Max compatibility, easiest playback/editing |
| vp9 | WebM | VP9 | Opus | Good on modern hardware (newer CPUs/GPUs) | Very good | ~30–50% better than H.264 | Medium | Good on modern players/browsers | Balance of quality and size, modern playback |
| av1 | WebM | AV1 (SVT-AV1 encode, dav1d decode) | Opus | Limited to newest GPUs/SoCs; software decode heavy | Excellent (4K/8K) | Best (often 20–30% better than VP9) | High | Best on latest players/browsers | Archival or bandwidth-sensitive use, modern environments |

Notes:

- The image enables software H.264 encoding (x264) and AV1 encoding (SVT-AV1). VP9 is available (libvpx) if needed, but default output is MP4/H.264 unless `--codec` is set.
- Hardware acceleration is not enabled in this image; all encoding/decoding is CPU-only.
- YouTube doesn’t serve MP3; typical audio is AAC (MP4) or Opus (WebM). No MP3 encoder is included.

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

### Notes

- By default the script filters to the last `YTDLP_DAYS` days in playlist mode. Set a different value with `-e YTDLP_DAYS=30` or disable date filtering by using `--oneshot` for direct URLs.
- The image includes a healthcheck that validates the presence of `/opt/scripts/yt-dlp.sh`, `yt-dlp` on PATH, and writability of `/media`.

[Last Build][packages]

[yt-dlp]: https://github.com/yt-dlp/yt-dlp
[packages]: PACKAGES.md
