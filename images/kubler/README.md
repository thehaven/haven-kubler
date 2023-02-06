## haven/kubler

Run this [kubler][] image with:

Basic check:
```bash
docker run -it --rm --name kubler --hostname kubler  haven/kubler
:/kubler docker.artifactory.thehavennet.org.uk/haven/kubler:latest
»[✔]»[kubler-images]» cloned.
 __        ___.   .__
|  | ____ _\_ |__ |  |   ___________
|  |/ /  |  \ __ \|  | _/ __ \_  __ \
|    <|  |  / \_\ \  |_\  ___/|  | \/
|__|_ \____/|___  /____/\___  >__|
     \/         \/          \/0.9.8

A container image meta builder

Usage: kubler [-w|--working-dir <arg>] [--debug] <command> ...
        <command>: Command to run
        ... : command-options
        -h,--help: Prints help
        -w,--working-dir: Where to look for namespaces or images, default: current directory
        -v,--verbose: More insight at the cost of noisier output, default: off

Commands:

build     - Build image(s) or namespace(s)
clean     - Remove build artifacts and/or delete built images
dep-graph - Visualize image dependencies
new       - Create a new namespace, image or builder
push      - Push image(s) or namespace(s) to a registry
update    - Check for new stage3 releases and kubler namespace updates

kubler <command> --help for more information on specific commands
```

Check Docker Compatibility via:
```bash
docker run -it --rm --name kubler --hostname kubler \
              --cpus=16 \
              --memory=16g \
              -v /var/run/docker.sock:/var/run/docker.sock \
              -v kubler:/kubler \
              haven/kubler:latest \
              /usr/bin/docker ps -a
```

You can then setup your /kubler mount with a new namespace and start building your own images:
* https://github.com/edannenberg/kubler#the-basics

[Last Build][packages]

[kubler]: https://kubler.url
[packages]: PACKAGES.md
