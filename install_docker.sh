#!/bin/bash
 
# Download and run script: wget -O - https://raw.githubusercontent.com/MadMax411/install-software/master/install_docker.sh | bash
 
GREEN='\033[1;32m'
NC='\033[0m' # No Color
 
printf "${GREEN}\n-- Installation of Docker and Docker-Compose\n\nUpdate the apt package index and install packages to allow apt to use a repository over HTTPS${NC}\n\n"
sudo apt-get update
 
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    -y
 
printf "${GREEN}-- Add Docker’s official GPG key${NC}\n"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
 
printf "${GREEN} -- Set up the stable repository${NC}\n"
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"#
 
printf "${GREEN}-- Install the latest version of Docker Engine and containerd${NC}\n"
sudo apt-get update
sudo apt-cache policy docker-ce
sudo apt-get install -y docker.io
 
printf "${GREEN}-- Configure Docker to start on boot${NC}\n"
sudo systemctl start docker
sudo systemctl enable docker
 
printf "${GREEN}-- Create the docker group${NC}\n"
sudo groupadd docker
 
printf "${GREEN}-- Add current user to the docker group${NC}\n"
sudo usermod -aG docker $USER
newgrp docker 
 
printf "${GREEN}\n\n-- Installation Docker-Compose V2.0.1 from Github${NC}\n"
sudo curl -L "https://github.com/docker/compose/releases/download/v2.0.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
 
printf "${GREEN}\n-- Verify installation of docker-compose${NC}\n"
docker-compose --version
 
# Verify that you can run docker commands without sudo
printf "${GREEN}\n-- Done!\n\nCheck installation of docker with command: 'docker run hello-world'\n"
printf "On permission errors try to reboot${NC}\n\n"
