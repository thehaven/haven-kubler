## haven/airsonic

Run this [airsonic][] image with:

```
docker run -d \
    --name airsonic --hostname airsonic \
    -p 4040:4040/tcp \
    -p 4050:4050/tcp \
    --cpus=4 \
    --memory=1g \
    -v media:/media \
    -v config:/config \
    --restart=unless-stopped \
    --label location=$(hostname) \
    haven/airsonic
```

There are three volume mounts avaiable, most folk will use just /media and /config:

```
/media # Mount for music
/config # Persist config
/storage/music # Legacy Music for my own environment
```

ENV overrides available with the following defaults:

```
ENV AIRSONIC_CONTEXT_PATH=/
ENV AIRSONIC_HOME=/config
ENV AIRSONIC_HOST=0.0.0.0
ENV AIRSONIC_HTTP_PORT=4040
ENV AIRSONIC_HTTPS_PORT=4050
ENV AIRSONIC_INIT_MEMORY=192
ENV AIRSONIC_MAX_MEMORY=1024
ENV AIRSONIC_DB=''
ENV AIRSONIC_DEFAULT_MUSIC_FOLDER=/media/default
ENV AIRSONIC_DEFAULT_UPLOAD_FOLDER=/media/uploaded
ENV AIRSONIC_DEFAULT_PODCAST_FOLDER=/media/podcast
ENV AIRSONIC_DEFAULT_PLAYLIST_IMPORT_FOLDER=/media/playlists/import
ENV AIRSONIC_DEFAULT_PLAYLIST_EXPORT_FOLDER=/media/playlists/export
ENV AIRSONIC_DEFAULT_PLAYLIST_BACKUP_FOLDER=/media/playlists/backup
ENV AIRSONIC_DEFAULT_TRANSCODE_FOLDER=/var/lib/airsonic/transcode
ENV AIRSONIC_DEFAULT_TIMEZONE='Europe/London'
ENV AIRSONIC_GZIP=true
ENV AIRSONIC_PROXY_TYPE=http
ENV AIRSONIC_PROXY_HOST=localhost
ENV AIRSONIC_PROXY_PORT=8888
```

[Last Build][packages]

[airsonic]: https://beta.airsonic.org/
[packages]: PACKAGES.md
