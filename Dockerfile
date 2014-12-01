FROM xprimaerp/odoo-build:u1404_o70_ar186
MAINTAINER Sebastien Delisle <seb0del@gmail.com>

RUN useradd -m odoo
RUN mkdir -p /odoo_server/community_addons
RUN chown -R odoo:odoo /odoo_server

RUN mkdir -p /entry_point_script
COPY odoo_cmd.sh /entry_point_script/
RUN chown -R odoo:odoo /entry_point_script

EXPOSE 8069

USER odoo

ENTRYPOINT ["/entry_point_script/odoo_cmd.sh"]
