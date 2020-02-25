## haven/jenkins-slave-ssh

Simple jenkins docker executor to run ssh commands on remote systems.

/workdir and /home/jenkins/.ssh are moutable volumes. Ensure you have any keys you need in the latter.

Run this [jenkins-slave-ssh][] image with:
```
docker run -d --name jenkins-slave-ssh haven/jenkins-slave-ssh:latest
```

For persistence run [jenkins-slave-ssh][] image with:
```bash
docker run -d --name jenkins-slave-ssh \
  -v <local path>:/workdir \
  -v ${HOME}/.ssh:/home/jenkins/.ssh \
  haven/jenkins-slave-ssh:latest
```

[Last Build][packages]

[jenkins-slave-ssh]: https://jenkins-slave-ssh.url
[packages]: PACKAGES.md
