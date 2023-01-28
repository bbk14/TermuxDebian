#!/bin/bash
RED='\033[1;31m'
GREEN='\033[1;32m'
termux-setup-storage
#install backup Termux
curl -s https://www.dropbox.com/s/5ie7s3f4cm1g3ag/termux.tar.gz --output /sdcard/termux.tar.gz
tar -zxf /sdcard/termux.tar.gz -C /data/data/com.termux/files --recursive-unlink --preserve-permissions
#install backup Debian
curl -s https://www.dropbox.com/s/qezfhj2iu4ynnr2/debian.tar.gz --output /sdcard/debian.tar.xz
proot-distro restore /sdcard/debian.tar.xz
#clean cache Termux
rm /sdcard/termux.tar.gz
rm /sdcard/debian.tar.xz
pkg clean
#Done
echo ""
echo "#############################################"
echo -e "${GREEN}***####Done####***"
echo -e "${RED}close Termux and open it again to apply changes!"
echo -e "${GREEN}type to close: ${RED}exit${NC}"
