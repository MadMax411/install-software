#!/bin/bash
GREEN='\033[1;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}>>> Install CMake...${NC}"
sudo apt install -y cmake build-essential

echo -e "${GREEN}>>> GoogleTest - Downloading V1.10.0...${NC}"
wget https://github.com/google/googletest/archive/release-1.10.0.tar.gz

echo -e "${GREEN}>>> Extracting files...${NC}"
tar -xzf release-1.10.0.tar.gz

echo -e "${GREEN}>>> Creating toolchain file...${NC}"
cd  googletest-release-1.10.0

echo -e "${GREEN}>>> Compiling GoogleTests...${NC}"
mkdir build && cd build && cmake .. && make -j4

echo -e "${GREEN}>>> Copying libs to /usr/lib...${NC}"
sudo cp lib/*.a /usr/lib

echo -e "${GREEN}>>> Copying headers to /usr/include...${NC}"
sudo cp -r ../googletest/include/gtest /usr/include

echo -e "${GREEN}>>> Cleanup...${NC}"
cd ../..
rm -r googletest-release-1.10.0
rm release-1.10.0.tar.gz

echo -e "${GREEN}>>> Ready${NC}"
