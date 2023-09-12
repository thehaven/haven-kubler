## haven/madsonic

Run this [madsonic][] image with:

```
docker run -d \
    --name madsonic --hostname madsonic \
    -p 4040:4040/tcp \
    -p 4050:4050/tcp \
    --cpus=4 \
    --memory=1g \
    -v media:/media \
    -v config:/config \
    --restart=unless-stopped \
    --label location=$(hostname) \
    haven/madsonic
```

There are three volume mounts avaiable, most folk will use just /media and /config:
 /media
 /config
 /storage/music (legacy for my own environment)

ENV overrides available with the following defaults:

```
ENV MADSONIC_CONTEXT_PATH=/
ENV MADSONIC_HOME=/config
ENV MADSONIC_HOST=0.0.0.0
ENV MADSONIC_HTTP_PORT=4040
ENV MADSONIC_HTTPS_PORT=4050
ENV MADSONIC_INIT_MEMORY=192
ENV MADSONIC_MAX_MEMORY=1024
ENV MADSONIC_DB=''
ENV MADSONIC_DEFAULT_MUSIC_FOLDER=/media/default
ENV MADSONIC_DEFAULT_UPLOAD_FOLDER=/media/uploaded
ENV MADSONIC_DEFAULT_PODCAST_FOLDER=/media/podcast
ENV MADSONIC_DEFAULT_PLAYLIST_IMPORT_FOLDER=/media/playlists/import
ENV MADSONIC_DEFAULT_PLAYLIST_EXPORT_FOLDER=/media/playlists/export
ENV MADSONIC_DEFAULT_PLAYLIST_BACKUP_FOLDER=/media/playlists/backup
ENV MADSONIC_DEFAULT_TRANSCODE_FOLDER=/var/lib/madsonic/transcode
ENV MADSONIC_DEFAULT_TIMEZONE='Europe/London'
ENV MADSONIC_GZIP=true
ENV MADSONIC_PROXY_TYPE=http
ENV MADSONIC_PROXY_HOST=localhost
ENV MADSONIC_PROXY_PORT=8888
```

[Last Build][packages]

[madsonic]: https://beta.madsonic.org/
[packages]: PACKAGES.md
