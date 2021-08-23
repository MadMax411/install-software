#!/bin/bash
GREEN='\033[1;32m'
NC='\033[0m' # No Color
 
printf "${GREEN}\n-- Installation of VirtualBox${NC}\n"

printf "${GREEN}\n-- Installation Linux-Headers...${NC}\n"
sudo pacman -S linux-headers

printf "${GREEN}\n-- Installation VirtualBox: Choose 'virtualbox-host-modules-arch'${NC}\n"
sudo pacman -S virtualbox virtualbox-guest-iso

printf "${GREEN}\n-- Modprobe of VBoxDrv...${NC}\n"
sudo modprobe vboxdrv

printf "${GREEN}\n-- Installation Oracle extentions...${NC}\n"
sudo pacman -S virtualbox-ext-oracle
