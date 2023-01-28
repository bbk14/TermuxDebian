#!/bin/bash
RED='\033[1;31m'
GREEN='\033[1;32m'
#install backup Termux
curl -s -O https://www.dropbox.com/s/5ie7s3f4cm1g3ag/termux.tar.gz
tar -zxf termux.tar.gz -C /data/data/com.termux/files --recursive-unlink --preserve-permissions
#install backup Debian
curl -s -O https://www.dropbox.com/s/qezfhj2iu4ynnr2/debian.tar.gz
proot-distro restore debian.tar.xz
#clean cache Termux
rm termux.tar.gz
rm debian.tar.xz
pkg clean
#Done
echo ""
echo "#############################################"
echo -e "${GREEN}***####Done####***"
echo -e "${RED}close Termux and open it again to apply changes!"
echo -e "${GREEN}type to close: ${RED}exit${NC}"
