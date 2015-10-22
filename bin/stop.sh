#!/bin/sh 
. bin/_require/init.sh

if [ -f "$TMP_FOLDER/docker.pid" ]; then
	echo "Stopping the container"

	# STOPPING THE CONTAINER
	CONTAINER_ID=$(cat $TMP_FOLDER/docker.pid)

	stop_command="docker stop $CONTAINER_ID"

	echo $stop_command
	eval $stop_command

	# REMOVING UNNECESSARY FILES/FOLDERS
	echo "Removing unnecessary files/folders"
	rm -fr $PROJECT_FOLDER/.tmp/
	rm -fr $TMP_FOLDER
	echo "Finished Stopping"
else
	echo "The container seems to be not running"

fi