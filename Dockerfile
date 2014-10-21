FROM maxc0c0s/odoo-build:7.0
MAINTAINER Sebastien Delisle <seb0del@gmail.com>

RUN useradd -m odoo
RUN chown -R odoo:odoo /odoo_server
EXPOSE 8069
USER odoo
