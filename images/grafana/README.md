## haven/grafana

Run this [Grafana][] 2.x image with:

    $ mkdir /var/lib/grafana
    $ docker run -d --name grafana-0 \
       -v /var/lib/grafana:/opt/grafana/data \
       -p 3000:3000 haven/grafana

Web interface:

    http://localhost:3000

Default admin credentials:

    admin/admin

[Last Build][packages]

[Grafana]: http://grafana.org/
[packages]: PACKAGES.md
