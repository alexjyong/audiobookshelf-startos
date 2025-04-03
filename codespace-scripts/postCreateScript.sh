#!/bin/bash

docker buildx install 
docker buildx create --use
docker run --privileged --rm linuxkit/binfmt:v0.8
git clone https://github.com/Start9Labs/start-os.git
cd start-os
git submodule update --init --recursive 
make sdk 
start-sdk init 
start-sdk --version