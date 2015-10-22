#!/bin/bash

echo "You should run this file only once"

echo "Starting"

docker-machine stop default
VBoxManage modifyvm "default" --natpf1 delete "tcp-port8080"
VBoxManage modifyvm "default" --natpf1 "tcp-port8080,tcp,,8080,,8080";
docker-machine start default

echo "Finished"
echo "Now you can access the app from http://localhost:8080/app"