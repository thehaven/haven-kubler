#!/usr/bin/env sh

# Simple liveness checks for the yt-dlp image
set -eu

# 1) Script exists and is executable
[ -x /opt/scripts/yt-dlp.sh ] || {
  echo "healthcheck: /opt/scripts/yt-dlp.sh missing or not executable" >&2
  exit 1
}

# 2) yt-dlp is on PATH
if ! command -v yt-dlp >/dev/null 2>&1; then
  echo "healthcheck: yt-dlp not found in PATH" >&2
  exit 1
fi

# 3) /media exists and is writable by current user (default 1000:1000)
if [ ! -d /media ]; then
  echo "healthcheck: /media directory not found" >&2
  exit 1
fi
if ! ( tmpfile="/media/.healthcheck-$$"; : >"$tmpfile" 2>/dev/null && rm -f "$tmpfile" ); then
  echo "healthcheck: /media not writable" >&2
  exit 1
fi

exit 0
