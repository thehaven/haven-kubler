## haven/roonlegacy

Run this [roonlegacy](https://hub.docker.com/r/haven/roonlegacy) image with:

    $ docker run -d --name roonlegacy haven/roonlegacy

For data persistence use the volume mounts /data and /media.

Host mode networking is also required:
```bash
docker run -d \
    --name roonlegacy --hostname roonlegacy \
    --cpus=8 \
    --memory=8g \
    --net=host \
    -v "data:/data" \
    -v "media:/media" \
    --restart=unless-stopped \
    haven/roonlegacy:latest
```

[Last Build][packages]

[roonlegacy]: https://roonlegacy.url
[packages]: PACKAGES.md
