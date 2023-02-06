## haven/artifactory

Run this [artifactory][] image with:

```bash
docker run -d -p 8081:8081/tcp \
 --restart=unless-stopped --name artifactory \
 haven/artifactory:latest /bin/sh /opt/artifactory/bin/artifactory.sh run
```
You can then connect to it via: http://<docker host ip>:8081 Default credentials are admin/password

For persistence mount against /opt/artifactory/data and /opt/artifactory/etc i.e.

```bash
docker run -d -p 8081:8081/tcp \
 -v data:/opt/artifactory/data \
 -v etc:/opt/artifactory/etc \
 --restart=unless-stopped \
 --name artifactory \
 haven/artifactory:latest /bin/sh /opt/artifactory/bin/artifactory.sh run 
```

[Last Build][packages]

[artifactory]: https://artifactory.url
[packages]: PACKAGES.md
