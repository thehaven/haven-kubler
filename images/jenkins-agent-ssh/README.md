## haven/jenkins-agent-ssh

Simple jenkins docker executor to run ssh commands on remote systems.

/workdir and /home/jenkins/.ssh are moutable volumes. Ensure you have any keys you need in the latter.

Run this [jenkins-agent-ssh][jenkins-agent-ssh] image with:
```
docker run --rm -it --name jenkins-agent-ssh haven/jenkins-agent-ssh:latest /bin/bash
```

For persistence run [jenkins-agent-ssh][jenkins-agent-ssh] image with:
```bash
docker run --rm -it --name jenkins-agent-ssh \
  -v <local path>:/workdir \
  -v ${HOME}/.ssh:/home/jenkins/.ssh \
  haven/jenkins-agent-ssh:latest /bin/bash
```

[Last Build][packages]

[jenkins-agent-ssh]: https://github.com/thehaven/haven-haven/blob/master/images/jenkins-agent-ssh
[packages]: https://github.com/thehaven/haven-haven/blob/master/images/jenkins-agent-ssh/PACKAGES.md
