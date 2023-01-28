#!/bin/bash
RED='\033[1;31m'
GREEN='\033[1;32m'
#install backup Termux
curl -s https://www.dropbox.com/s/5ie7s3f4cm1g3ag/termux.tar.gz --output termux.tar.gz
chmod +rx termux.tar.gz
tar -zxf /sdcard/termux.tar.gz -C /data/data/com.termux/files --recursive-unlink --preserve-permissions
wait $!
#install backup Debian
curl -s https://www.dropbox.com/s/qezfhj2iu4ynnr2/debian.tar.gz --output debian.tar.xz
chmod +rx debian.tar.xz
proot-distro restore debian.tar.xz
wait $!
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
