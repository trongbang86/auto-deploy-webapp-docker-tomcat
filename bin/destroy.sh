#!/bin/sh

. bin/_require/init.sh

IMAGE_ID=$(docker images | grep $IMAGE_NAME | awk '{print $3}')

if [ -n $IMAGE_ID ]; then
	echo "Removing the image"
	echo "IMAGE_ID: $IMAGE_ID"
	destroy_command="docker rmi -f $IMAGE_ID"
	echo $destroy_command
	eval $destroy_command
else
	echo "You haven't built the image yet"
fi