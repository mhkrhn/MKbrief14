#!/bin/bash

#Installing Docker

sudo apt-get update -y
sudo apt-get install -y

sudo curl -fsSL https://get.docker.com/ -o init-script.sh
sudo sh init-script.sh

sudo wget https://github.com/mhkrhn/MKbrief14.git
sudo docker run -d --name mktest14 -p 5000:80 mhkrhn/mkbrief14
