#!/bin/bash
sudo apt-get update -y && sudo apt-get install -y docker.io
sudo docker run -d --name lab1  -p 80:80 viktorshu/trist_lab1
sudo docker run -d --name watchtower -e WATCHTOWER_CLEANUP=true -e WATCHTOWER_POLL_INTERVAL=30 -v /var/run/docker.sock:/var/run/docker.sock containrrr/watchtower