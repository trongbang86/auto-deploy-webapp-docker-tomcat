#!/bin/sh

. bin/_require/init.sh

if [ -f "$TMP_FOLDER/docker.pid" ] && [ -n "$(cat $TMP_FOLDER/docker.pid)" ]; then
	echo "There seems to be another container running for this project."
	echo "Please stop it first by running bin/stop.sh"
else
	. bin/_require/start_main.sh
fi