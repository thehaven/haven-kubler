#!/bin/env bash

# Chrome cookies plugin:
# https://chrome.google.com/webstore/detail/cookiestxt/njabckikapfpffapmjgojcnbfjonfjfg/related

# Grab anything from the last 7 days by default, pass oneshot as first parameter to script to grab everything.
if [ "$ONESHOT" == 'oneshot' ]; then
  DATE=''
elif echo "${YOUTUBE_LINK}" | grep -q 'www.youtube.com'; then
  DOWNLOAD="${YOUTUBE_LINK}"
  DATE="--dateafter $( date --date='7 days ago' '+%Y%m%d' )"
else
  DATE="--dateafter $( date --date='7 days ago' '+%Y%m%d' )"
fi

if [ ! -z "$2" ]; then
  DOWNLOAD="${2}"
elif [ -z ${DOWNLOAD} ]; then
  DOWNLOAD="--batch-file=${DOWNLOAD_DIR_YOUTUBE}/channel_list.txt"
fi

# Youtube:
youtube-dl ${DATE} --user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.41 Safari/537.36" --ignore-errors --playlist-reverse --sleep-interval 5 --cookies ${DOWNLOAD_DIR_YOUTUBE}/cookies.txt --download-archive ${DOWNLOAD_DIR_YOUTUBE}/downloaded.txt -i -o "${DOWNLOAD_DIR_YOUTUBE}/%(uploader)s: %(playlist_title)s [%(playlist_id)s]/%(playlist)s - s01e%(playlist_index)s - %(title)s [%(id)s].%(ext)s" -f bestvideo[ext=mp4]+bestaudio[ext=m4a] --merge-output-format mp4 --embed-thumbnail --add-metadata --write-thumbnail ${DOWNLOAD}
