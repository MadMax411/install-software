#!/bin/bash
 
# Download and run script: wget -O - https://raw.githubusercontent.com/MadMax411/install-software/master/install_docker-compose.sh | bash
 
GREEN='\033[1;32m'
NC='\033[0m' # No Color

VERSION_DOCKER_COMPOSE=$(curl -s -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/docker/compose/releases/latest | jq -r .tag_name)

printf "${GREEN}\n\n-- Installation Docker-Compose ${VERSION_DOCKER_COMPOSE} from Github${NC}\n"
sudo curl -L "https://github.com/docker/compose/releases/download/${VERSION_DOCKER_COMPOSE}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
 
printf "${GREEN}\n-- Verify installation of docker-compose${NC}\n"
docker-compose --version
