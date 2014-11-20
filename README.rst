Docker Odoo
===========
This image is based on maxc0c0s/odoo-build:u1404_o70_ar186.

Usage:

    $ sudo docker run -dp 8069:8069 maxc0c0s/odoo:dev -s

    Params:
     - -s: Build and start the server.
     - -b: build the buildout.
     - -u: upgrade the specified database. ex. -u database-name /in-container/config/file
      no params: start an /bin/bash shell.
