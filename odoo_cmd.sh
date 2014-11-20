#!/usr/bin/env bash

BUILDOUT_CMD="bin/buildout -c"

function build {
	if [ $1  ]; then
		config_file=$1
	else
		config_file="init_versions.cfg"
	fi
	$BUILDOUT_CMD $config_file
}

if [ "$1" == "-b" ]; then
	build $2
elif [ "$1" == "-s" ]; then
	build $2
	bin/start_odoo
elif [ "$1" == "-u" ]; then
	build $3
	bin/upgrade_odoo -d $2
else
	/bin/bash
fi
