FROM xprimaerp/odoo-deps:ubuntu_1404
MAINTAINER Sebastien Delisle <seb0del@gmail.com>

RUN adduser --system --shell /bin/bash --group odoo

RUN apt-get install -y git

RUN mkdir -p /entry_point_script
COPY odoo_cmd.sh /entry_point_script/
RUN chown -R odoo:odoo /entry_point_script

RUN git clone -b odoo_80_ar_191 https://github.com/Xprima-ERP/anybox_buildout_odoo.git /odoo_server
RUN mkdir -p /odoo_server/community_addons
RUN chown -R odoo:odoo /odoo_server

EXPOSE 8069

USER odoo

WORKDIR /odoo_server
RUN python bootstrap-buildout.py
RUN bin/buildout -c init_versions.cfg

ENTRYPOINT ["/entry_point_script/odoo_cmd.sh"]
