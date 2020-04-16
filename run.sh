#!/usr/bin/env bash

if [ "$(docker ps -a | grep config-server)" ]; then
    docker rm config-server
fi

# Generate the application's jar file
gradle bootJar

port=8086

# Build the docker image using the Dockerfile placed in this folder
docker build -t config-server:1 --build-arg jar_file=./build/libs/config-server.jar --build-arg port=${port} .
docker run --name config-server -p ${port}:${port} config-server:1
