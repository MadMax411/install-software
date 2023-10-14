#!/bin/bash
GREEN='\033[1;32m'
NC='\033[0m' # No Color

CONTENT=$(curl -s https://go.dev/VERSION?m=text) 
VERSION=$(echo $CONTENT | cut -d " " -f 1)
INSTALLDIR=/usr/local/go
FILE=$VERSION.linux-amd64.tar.gz
URL=https://go.dev/dl/$FILE

echo -e "${GREEN}\n>>> Downloading Go ${VERSION:2}...${NC}"
wget $URL
 
if [ -d "$INSTALLDIR" ]; then
    echo -e "${GREEN}>>> Remove old Go version...${NC}"
    sudo rm -rf $INSTALLDIR
fi

echo -e "${GREEN}>>> Extract go tar-package...${NC}"
sudo tar -C /usr/local -xzf $FILE
rm $FILE > /dev/null

if [[ ! "$PATH" == *"$INSTALLDIR/bin"* ]]; then
    echo -e "${GREEN}>>> Set ENV variables for Go...${NC}"
    echo "" >> ~/.bashrc
    echo "export PATH=${PATH}:${INSTALLDIR}/bin" >> ~/.bashrc
    export PATH=$PATH:$INSTALLDIR/bin
fi

echo -e "\n${GREEN}>>> Ready to Go!${NC}"

go version
