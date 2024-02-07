#!/bin/bash

sudo apt-get update
sudo apt-get install -y curl wget

curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

cd /home

if [ ! -f "${tar}" ]; then
    wget ${version}
    tar -xzf ${tar}
fi

sudo ./twistlock.sh -sy onebox
