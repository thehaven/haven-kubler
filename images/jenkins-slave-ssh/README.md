## haven/jenkins-slave-ssh

Simple jenkins docker executor to run ssh commands on remote systems.

/workdir and /home/jenkins/.ssh are moutable volumes. Ensure you have any keys you need in the latter.

Run this [jenkins-slave-ssh][] image with:

    $ docker run -d --name jenkins-slave-ssh haven/jenkins-slave-ssh

[Last Build][packages]

[jenkins-slave-ssh]: https://jenkins-slave-ssh.url
[packages]: PACKAGES.md
