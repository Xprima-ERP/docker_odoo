#!/usr/bin/env bash

function build {
	BUILDOUT_CMD="bin/buildout -c"
	if [ $1  ]; then
		config_file=$1
	else
		config_file="buildout.cfg"
	fi
	$BUILDOUT_CMD $config_file
}

function usage {
cat << END

usage: $0 [options] config_file

This script is a Docker entry point to use with the image maxc0c0s/odoo.

config_file: The path of the buildout config file.

OPTIONS:
   -b                   		Build using Anybox recipe
   -c                   		Start command line /bin/bash
   -h                   		Show this message
   -s                   		Build and start the odoo server
   -t comma separated module list       Build, create a test tb, run the tests, drop the test db
   -u database_name     		Build and update the database
END
}

OPTSTRING=":bchst:u:"

# Get the indice of the config_file. It should be afte all the options.
while getopts $OPTSTRING opt; do
	config_file_ind=$((OPTIND-1)) 
done

# Get config file.
args_array=( "$@" )
config_file=${args_array[$config_file_ind]}

# Set unittest db name.
UNITTEST_DB_NAME="odoo_unittest_db_temp"

# There must be a db name, else exit the script.
if [[ -z $config_file ]]
then
	usage
	exit 1
fi

# Reset getopts
OPTIND=1

while getopts $OPTSTRING opt; do
	case $opt in
		b)
			build $config_file
			;;
		s)
			build $config_file
			bin/start_odoo
			;;
		u)
			build $config_file
			bin/start_odoo --stop-after-init -d $OPTARG -u all
			;;
		c)
			/bin/bash
			;;
		h)
			usage
			;;
		t)
			build $config_file
			bin/create_db_odoo $UNITTEST_DB_NAME
			bin/start_odoo --stop-after-init --test-enable -d $UNITTEST_DB_NAME -i $OPTARG
			bin/drop_db_odoo $UNITTEST_DB_NAME
			;;
		\?)
			usage
			;;
	esac
done
