#!/bin/bash
 
GREEN='\033[1;32m'
NC='\033[0m' # No Color
 
printf "${GREEN}\nInstallation of Docker and Docker-Compose\n\nUpdate the apt package index and install packages to allow apt to use a repository over HTTPS${NC}\n"
sudo apt-get update
 
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    -y
 
printf "${GREEN}Add Docker’s official GPG key${NC}\n"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
 
printf "${GREEN}Set up the stable repository${NC}\n"
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"#
 
printf "${GREEN}Install the latest version of Docker Engine and containerd${NC}\n"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
 
printf "${GREEN}Configure Docker to start on boot${NC}\n"
sudo systemctl start docker
sudo systemctl enable docker
 
printf "${GREEN}Create the docker group${NC}\n"
sudo groupadd docker
 
printf "${GREEN}Add current user to the docker group${NC}\n"
sudo usermod -aG docker $USER
 
printf "${GREEN}\n\nInstallation Docker-Compose V1.29.2 from Github${NC}\n"
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
 
printf "${GREEN}\nVerify installation of docker-compose${NC}\n"
docker-compose --version
 
# Verify that you can run docker commands without sudo
printf "${GREEN}\nDone!\n\nCheck installation of docker with command: 'docker run hello-world'\n"
printf "On permission errors try to reboot${NC}\n\n"

