## haven/roon

Run this [roon](https://hub.docker.com/r/haven/roon) image with:

    $ docker run -d --name roon haven/roon

For data persistence use the volume mounts /data and /media.

Host mode networking is also required:
```bash
docker run -d \
    --name roon --hostname roon \
    --cpus=8 \
    --memory=8g \
    --net=host \
    -v "data:/data" \
    -v "media:/media" \
    --restart=unless-stopped \
    haven/roon:latest
```

[Last Build][packages]

[roon]: https://roon.url
[packages]: PACKAGES.md
