#!/bin/bash
GREEN='\033[1;32m'
NC='\033[0m' # No Color

VERSION=1.17
INSTALLDIR=/usr/local/go
 
echo -e "${GREEN}\n>>> Downloading Go Version '$VERSION'...${NC}"
wget https://golang.org/dl/go$VERSION.linux-amd64.tar.gz
 
if [ -d "$INSTALLDIR" ]; then
    echo -e "${GREEN}>>> Remove old Go version...${NC}"
    rm -rf $INSTALLDIR
fi

echo -e "${GREEN}>>> Extract go tar-package...${NC}"
tar -C /usr/local -xzf go$VERSION.linux-amd64.tar.gz 
rm go$VERSION.linux-amd64.tar.gz > /dev/null

echo -e "${GREEN}>>> Set ENV variables for Go...${NC}"
echo '' >> ~/.bashrc
echo 'export PATH=$PATH:$INSTALLDIR' >> ~/.bashrc
export PATH=$PATH:$INSTALLDIR

echo -e "\n${GREEN}>>> Ready to Go! Show version...${NC}"

go version
