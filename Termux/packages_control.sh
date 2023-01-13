#!/bin/bash
#color
RED='\033[1;31m'
GREEN='\033[1;32m'
PURPLE='\033[0;35m'
BLUE='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

PS3=$'\e[1;33mWhat we do today: \e[0;33m'

select option in Install Uninstall Quit; do
case $option in
Install)
proot-distro login debian -- curl -s -J -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/Debian/install.sh
proot-distro login debian -- bash install.sh
;;
Uninstall)
proot-distro login debian -- curl -s -J -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/Debian/uninstall.sh
proot-distro login debian -- bash uninstall.sh
;;
Quit)
break
;;
*)
echo -e "${RED}Invalid input $REPLY
${PURPLE}*configuration apply immediately and autorestart after  changes ${GREEN}Install ${NC}or ${RED}Uninstall"
;;
esac
echo -e "${NC}${GREEN}***####Done####***"
echo -e "${RED}close Termux and open it again!"
echo -e "${GREEN}type to close: ${RED}exit${NC}"
exit
done
