## haven/bash

Run this [Exim][] image with:

    $ docker run -d -m 512m --name exim -p 25:25 -p 465:465 -p 587:587 haven/exim

[Last Build][packages]

[Exim]: https://exim.org/
[packages]: PACKAGES.md
