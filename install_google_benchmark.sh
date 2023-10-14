#!/bin/bash
GREEN='\033[1;32m'
NC='\033[0m' # No Color
 
printf "${GREEN}\n-- Installation of Google Benchmark${NC}"

if [[ -z $(which cmake) ]]; then
    printf "${GREEN}\n-- Install CMake${NC}"
    sudo apt-get update && sudo apt-get install -y cmake
fi

if [ -d "benchmark" ]; then
    printf "${GREEN}\n-- Removing existing directory 'benchmark'${NC}"
    sudo rm -r benchmark
fi

printf "${GREEN}\n-- Check out the library${NC}\n"
git clone https://github.com/google/benchmark.git

printf "${GREEN}\n-- Go to the library root directory${NC}\n"
cd benchmark

printf "${GREEN}\n-- Make a build directory to place the build output${NC}\n"
cmake -E make_directory "build"

printf "${GREEN}\n-- Generate build system files with cmake, and download any dependencies${NC}\n"
cmake -E chdir "build" cmake -DBENCHMARK_DOWNLOAD_DEPENDENCIES=on -DCMAKE_BUILD_TYPE=Release ../

printf "${GREEN}\n-- Build the library 'Google Benchmark'${NC}\n"
cmake --build "build" --config Release --parallel $(nproc)

printf "${GREEN}\n-- Check the library${NC}\n"
cd build && make test -j $(nproc)

printf "${GREEN}\n-- Install the library globally as root${NC}\n"
sudo make install

printf "${GREEN}\n-- Cleanup${NC}\n"
cd ../..
sudo rm -r benchmark/

printf "${GREEN}\n-- Ready${NC}\n}n"
