#!/bin/bash
. bin/_require/init.sh

IMAGE_ID=$(docker images | grep $IMAGE_NAME | awk '{print $3}')

if [ -n $IMAGE_ID ]; then
	docker_build="docker build -t $IMAGE_NAME ."
	echo $docker_build
	eval $docker_build
else
	echo "You have already built the image for this"
	echo "You can bin/destroy.sh and bin/build.sh again"
fi