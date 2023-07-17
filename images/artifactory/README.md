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
 -v data:/opt/jfrog/artifactory/var/data \
 -v etc:/opt/jfrog/artifactory/var/etc \
 -v log:/opt/jfrog/artifactory/var/log
 --restart=unless-stopped \
 --name artifactory \
 --hostname artifactory \
 haven/artifactory:latest /bin/sh /opt/artifactory/bin/artifactory.sh
```

[Last Build][packages]

[artifactory]: https://artifactory.url
[packages]: PACKAGES.md
