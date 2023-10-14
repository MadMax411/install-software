#!/bin/bash
GREEN='\033[1;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}>>> Install CMake...${NC}"
sudo apt install -y cmake build-essential

echo -e "${GREEN}>>> GoogleTest - Downloading V1.14.0...${NC}"
wget https://github.com/google/googletest/archive/refs/tags/v1.14.0.tar.gz

echo -e "${GREEN}>>> Extracting files...${NC}"
tar -xzf v1.14.0.tar.gz

echo -e "${GREEN}>>> Creating toolchain file...${NC}"
cd googletest-1.14.0

echo -e "${GREEN}>>> Compiling GoogleTests...${NC}"
mkdir build && cd build && cmake .. && make -j$(nproc)

echo -e "${GREEN}>>> Copying libs to /usr/lib...${NC}"
sudo cp lib/*.a /usr/lib

echo -e "${GREEN}>>> Copying headers to /usr/include...${NC}"
sudo cp -r ../googletest/include/gtest /usr/include

echo -e "${GREEN}>>> Cleanup...${NC}"
cd ../..
rm -r googletest-1.14.0
rm v1.14.0.tar.gz

echo -e "${GREEN}>>> Ready${NC}"
