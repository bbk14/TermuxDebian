#!/bin/bash
RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\033[1;36m'
YELLOW='\033[1;33m'
PURPLE='\033[0;35m'
NC='\033[0m'

echo -e "${RED}*****### NOTE ###*****"
echo -e " ${BLUE}***With love ${YELLOW}from Ukraine***"
#check if Lampac is installed
if proot-distro login debian -- [ -d "/home/lampac" ];
then
echo ""
echo -e "${NC}${GREEN}Lampac running in background ip:9118"
echo -e "${RED}info Lampac: https://github.com/immisterio/Lampac"
echo -e "${BLUE}connect to Lampac session:"
echo -e " ${YELLOW}tmux attach -t Lampac${NC}"
echo -e "${NC}${BLUE}change Lampac config:"
echo -e " ${YELLOW}nano /home/lampac/init.conf${NC}"
grep -qxF 'tmux new-session -s Lampac -d "proot-distro login debian -- bash /root/lampac_updater.sh"' .bashrc || echo 'tmux new-session -s Lampac -d "proot-distro login debian -- bash /root/lampac_updater.sh"' >> .bashrc
else
sed -i '/-t Lampac/d' .bashrc
fi
#check if Jackett is installed
if proot-distro login debian -- [ -d "/home/Jackett" ];
then
echo ""
echo -e "${NC}${GREEN}Jackett running in background ip:9117"
echo -e "${RED}info Jackett: https://github.com/Jackett/Jackett"
echo -e "${BLUE}connect to Lampac session:"
echo -e " ${YELLOW}tmux attach -t Jackett${NC}"
echo -e "${NC}${BLUE}change APIKey Jackett:"
echo -e " ${YELLOW}nano /root/.config/Jackett/ServerConfig.json${NC}"
grep -qxF 'tmux new-session -s Jackett -d "proot-distro login debian -- /home/Jackett/./jackett"' .bashrc || echo 'tmux new-session -s Jackett -d "proot-distro login debian -- /home/Jackett/./jackett"' >> .bashrc
else
sed -i '/-t Jackett/d' .bashrc
fi
#check if Torrserver is installed
if proot-distro login debian -- [ -d "/home/torrserver" ];
then
echo ""
echo -e "${NC}${GREEN}Torrserver running in background ip:8091"
echo -e "${RED}info Torrserver: https://github.com/YouROK/TorrServer"
echo -e "${BLUE}connect to Torrserver session:"
echo -e " ${YELLOW}tmux attach -t Torrserver${NC}"
grep -qxF 'tmux new-session -s Torrserver -d "proot-distro login debian -- /home/torrserver/torrserver -p 8091"' .bashrc || echo 'tmux new-session -s Torrserver -d "proot-distro login debian -- /home/torrserver/torrserver -p 8091"' >> .bashrc
else
sed -i '/-t Torrserver/d' .bashrc
fi
#check if Midnight Commander is installed
if proot-distro login debian -- [ -d "/etc/mc" ];
then
echo ""
echo -e "${NC}${BLUE}run Midnight Commander:"
echo -e " ${YELLOW}proot-distro login debian -- mc${NC}"
fi
echo ""
echo -e "${PURPLE}run packages control to install or unistall them:"
echo -e "${BLUE}*it run at every boot Termux"
echo -e " ${YELLOW}bash packages_control.sh"
echo ""
echo -e "${BLUE}list sessions when you in Tmux:"
echo -e " ${YELLOW}Ctrl+B+S"
echo ""
echo -e "${BLUE}disconnect from session when you in Tmux:"
echo -e " ${YELLOW}Ctrl+B+D"
echo ""
echo -e "${BLUE}stop all sessions and packages:"
echo -e " ${YELLOW}tmux kill-server${NC}"
echo ""
echo -e "${NC}${BLUE}start Debian for more settings:"
echo -e " ${YELLOW}proot-distro login debian${NC}"
sed -i "/#GreetingStart/,/#GreetingEnd:/d" .bashrc
cat <<EOT >> .bashrc
#GreetingStart
bash note.sh
bash packages_control.sh
#GreetingEnd
EOT
echo ""
echo -e "${YELLOW}packages control to ${GREEN}install ${YELLOW}or ${RED}unistall${NC}"
