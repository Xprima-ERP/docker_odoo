#!/usr/bin/env bash

if [ "$1" == "-b" ]; then
	bin/buildout
elif [ "$1" == "-s" ]; then
	bin/buildout
	bin/start_odoo
else
	/bin/bash
fi
