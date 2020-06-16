## haven/jenkins-slave-ssh

Simple jenkins docker executor to run ssh commands on remote systems.

/workdir and /home/jenkins/.ssh are moutable volumes. Ensure you have any keys you need in the latter.

Run this [jenkins-slave-ssh][jenkins-slave-ssh] image with:
```
docker run --rm -it --name jenkins-slave-ssh haven/jenkins-slave-ssh:latest /bin/bash
```

For persistence run [jenkins-slave-ssh][jenkins-slave-ssh] image with:
```bash
docker run --rm -it --name jenkins-slave-ssh \
  -v <local path>:/workdir \
  -v ${HOME}/.ssh:/home/jenkins/.ssh \
  haven/jenkins-slave-ssh:latest /bin/bash
```

[Last Build][packages]

[jenkins-slave-ssh]: https://github.com/thehaven/haven-haven/blob/master/images/jenkins-slave-ssh
[packages]: https://github.com/thehaven/haven-haven/blob/master/images/jenkins-slave-ssh/PACKAGES.md
