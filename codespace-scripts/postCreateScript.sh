#!/bin/bash

docker buildx install 
docker buildx create --use
docker run --privileged --rm linuxkit/binfmt:v0.8
# git clone https://github.com/Start9Labs/start-os.git
# cd start-os
# git submodule update --init --recursive 
# make sdk 
wget https://github.com/alexjyong/audiobookshelf-startos/releases/download/start-cli-scripts/start-sdk-utilities.tar
tar -xf start-sdk-utilities.tar
cd start-sdk-utilities
mv start-* /usr/local/cargo/bin/

start-sdk init 
start-sdk --version