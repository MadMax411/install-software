#!/bin/bash
GREEN='\033[1;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}>>> Install denpendencies...${NC}"
sudo apt install -y ninja-build libglib2.0-dev libfdt-dev libpixman-1-dev zlib1g-dev 
                    libnfs-dev libiscsi-dev gtk2-devel libsdl1.2-dev vte-devel checkinstall

echo -e "${GREEN}>>> Cloning QEMU...${NC}"
git clone https://gitlab.com/qemu-project/qemu.git

echo -e "${GREEN}>>> Update submodules...${NC}"
cd qemu
git submodule init
git submodule update --recursive

echo -e "${GREEN}>>> Configure...${NC}"
mkdir build
cd build
../configure --enable-debug

echo -e "${GREEN}>>> Building QEMU...${NC}"
make -j $(nproc)

echo -e "${GREEN}>>> Installing QEMU...${NC}"
sudo ninja install

echo -e "${GREEN}>>> Ready!${NC}"
