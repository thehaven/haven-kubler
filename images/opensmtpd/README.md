## haven/opensmtpd

Run this [OpenSMTPD][] image with:

    $ docker run -d -v /my.conf:/etc/opensmptd/smptd.conf -p 25:25 --name mail_relay haven/opensmtpd

Basic install, primarily intended as mail relay for other containers.

[Last Build][packages]

[OpenSMTPD]: https://www.opensmtpd.org/
[packages]: PACKAGES.md
