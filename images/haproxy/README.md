## haven/haproxy

Run this [haproxy](https://hub.docker.com/repository/docker/haven/haproxy) image with:

```bash
docker run -d \
    --name haproxy --hostname haproxy \
    -p 80:80/tcp \
    -p 443:443/tcp \
    --cpus=4 \
    --memory=1g \
    -v "config:/etc/haproxy/" \
    -v "ssl:/etc/ssl/" \
    --restart=unless-stopped \
    haven/haproxy:latest
```

[Last Build][packages]

[packages]: PACKAGES.md
