# Docker Odoo

This image is based on xprimaerp/odoo-deps.

## Entrypoint Usage
###usage: 
 odoo_cmd.sh [options] config_file

 This script is a Docker entry point to use with the image xprimaerp/odoo.

 config_file: The path of the buildout config file.

 OPTIONS:
    -b  Build using Anybox recipe
       
    -c  Start command line /bin/bash
          
    -h  Show this message
             
    -s  Build and start the odoo server
                
    -t  LIST(comma separated module list) Build, create a test tb, run the tests, drop the test db
                   
    -u  DBNAME(database_name) Build and update the database
