#!/bin/bash
GREEN='\033[1;32m'
NC='\033[0m' # No Color

cd ~/
echo -e "${GREEN}>>> Downloading crosscompiler from linaro.org...${NC}"
wget https://releases.linaro.org/components/toolchain/binaries/6.2-2016.11/arm-linux-gnueabihf/gcc-linaro-6.2.1-2016.11-i686_arm-linux-gnueabihf.tar.xz
cd /opt
echo -e "${GREEN}>>> Extracting tar-archive to /opt ...${NC}"
sudo tar -xf ~/gcc-linaro-6.2.1-2016.11-i686_arm-linux-gnueabihf.tar.xz
echo -e "${GREEN}>>> Create symbol links...${NC}"
sudo ln -s gcc-linaro-6.2.1-2016.11-i686_arm-linux-gnueabihf gcc-linaro
sudo ln -s gcc-linaro/arm-linux-gnueabihf/libc sysroot

echo -e "${GREEN}>>> Cleanup ...${NC}"
rm -v ~/gcc-linaro-6.2.1-2016.11-i686_arm-linux-gnueabihf.tar.xz

echo -e "${GREEN}>>> Ready${NC}"