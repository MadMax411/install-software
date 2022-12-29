#!/bin/bash
GREEN='\033[1;32m'
NC='\033[0m' # No Color

printf "${GREEN}\n-- Install Orcale VirtualBox 7.0${NC}\n\n"

printf "${GREEN}\n-- Adding Oracla to sources.list...${NC}\n"
sudo echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian jammy contrib" >> /etc/apt/sources.list

printf "${GREEN}\n-- Adding Oracle public key...${NC}\n"
wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --dearmor --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg

printf "${GREEN}\n-- Update packages...${NC}\n"
sudo apt update 

printf "${GREEN}\n-- Install VirtualBox...${NC}\n"
sudo apt install -y virtualbox-7.0
 