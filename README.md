Docker Odoo
===========
This image is based on maxc0c0s/odoo-build:7.0.

Usage:

    $ sudo docker run -dp 8069:8069 maxc0c0s/odoo:dev -s

Params:

-s: Build and start the server.
-b: build the buildout.
-u: upgrade the specified database. ex. -u /in-container/config/file database-name
no params: start an /bin/bash shell.
