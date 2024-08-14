#!/bin/bash
GREEN='\033[1;32m'
NC='\033[0m' # No Color

CONTENT=$(curl -s https://go.dev/VERSION?m=text) 
VERSION=$(echo $CONTENT | cut -d " " -f 1)
INSTALLED_VERSION="goNone"
INSTALLDIR=/usr/local/go
FILE=$VERSION.linux-amd64.tar.gz
URL=https://go.dev/dl/$FILE

# Check if go exsits and check if newest version is installed
if [ -f "$(which go)" ]; then
    INSTALLED_VERSION=$(go version | cut -d " " -f 3)
    if [ "$INSTALLED_VERSION" = "$VERSION" ]; then
        echo -e "${GREEN}Newest version ${VERSION:2} of Go is already installed${NC} 🙂"
        exit 0
    fi
fi

# Download the new version
echo -e "${GREEN}\n>>> Current Version ${INSTALLED_VERSION:2} -> Downloading newer version ${VERSION:2}...${NC}"
wget $URL
 
# Remove the old installation directory
if [ -d "$INSTALLDIR" ]; then
    echo -e "${GREEN}>>> Remove old Go version...${NC}"
    sudo rm -rf $INSTALLDIR
fi

# Extract the the version of Go
echo -e "${GREEN}>>> Extract go tar-package...${NC}"
sudo tar -C /usr/local -xzf $FILE
rm $FILE > /dev/null

# Add the install directory to path env
if [[ ! "$PATH" == *"$INSTALLDIR/bin"* ]]; then
    echo -e "${GREEN}>>> Set ENV variables for Go...${NC}"
    echo "" >> ~/.bashrc
    echo "export PATH=${PATH}:${INSTALLDIR}/bin" >> ~/.bashrc
    export PATH=$PATH:$INSTALLDIR/bin
fi

echo -e "\n${GREEN}>>> Ready to Go!${NC}"

go version
