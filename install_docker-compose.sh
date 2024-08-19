#!/bin/bash
 
# Download and run script: wget -O - https://raw.githubusercontent.com/MadMax411/install-software/master/install_docker-compose.sh | bash

GREEN='\033[1;32m'
NC='\033[0m' # No Color

VERSION_DOCKER_COMPOSE=$(curl -s -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/docker/compose/releases/latest | jq -r .tag_name)
MACHINE=$(uname -s)
ARCH=$(uname -m)
DOWNLOAD_URL=$(curl -s -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/docker/compose/releases/latest | jq -r '.assets[] | select(.name == "docker-compose-'${MACHINE,,}'-'$ARCH'").browser_download_url')

# Check if docker-compose exsits and check if newest version is installed
if [ -f "$(which docker-compose)" ]; then
    INSTALLED_VERSION=$(docker-compose --version | cut -d " " -f 4)
    if [ "$INSTALLED_VERSION" = "$VERSION_DOCKER_COMPOSE" ]; then
        echo -e "${GREEN}Newest version ${VERSION_DOCKER_COMPOSE:1} of Docker-Compose is already installed${NC} 🙂"
        exit 0
    fi
fi

printf "${GREEN}\n-- Installation Docker-Compose ${VERSION_DOCKER_COMPOSE} from ${DOWNLOAD_URL}...${NC}\n"

#OLD: sudo curl -L "https://github.com/docker/compose/releases/download/${VERSION_DOCKER_COMPOSE}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo curl -L ${DOWNLOAD_URL} -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose
 
printf "${GREEN}\n-- Verify installation of docker-compose${NC}\n"
docker-compose --version
