#!/bin/bash
GREEN='\033[1;32m'
NC='\033[0m' # No Color
 
printf "${GREEN}\n-- Installation of Docker and Docker-Compose${NC}\n"
sudo pacman -S docker
 
printf "${GREEN}-- Configure Docker to start on boot${NC}\n"
sudo systemctl start docker
sudo systemctl enable docker
 
printf "${GREEN}-- Create the docker group${NC}\n"
sudo groupadd docker
 
printf "${GREEN}-- Add current user to the docker group${NC}\n"
sudo usermod -aG docker $USER
newgrp docker 
 
printf "${GREEN}\n\n-- Installation Docker-Compose V1.29.2 from Github${NC}\n"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
 
printf "${GREEN}\n-- Verify installation of docker-compose${NC}\n"
docker-compose --version
 
# Verify that you can run docker commands without sudo
printf "${GREEN}\n-- Done!\n\nCheck installation of docker with command: 'docker run hello-world'\n"
printf "On permission errors try to reboot${NC}\n\n"
