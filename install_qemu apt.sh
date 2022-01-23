#!/bin/bash
GREEN='\033[1;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}>>> Installing...${NC}"
sudo apt install -y qemu-kvm libvirt-bin virtinst
                    
echo -e "${GREEN}>>> Add ...${NC}"
sudo adduser $USER libvirtd

echo -e "${GREEN}>>> Ready!${NC}"
