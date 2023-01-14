#!/bin/bash
RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\033[1;36m'
YELLOW='\033[1;33m'
PURPLE='\033[0;35m'
NC='\033[0m'

echo -e " ${BLUE}***With love ${YELLOW}from Ukraine***"
echo -e "    ${RED}*****### NOTE ###*****"

#check if Lampac is installed
if proot-distro login debian -- [ -d "/home/lampac" ];
then
echo ""
echo -e "${BLUE}Lampac running in background ${GREEN}ip:9118"
echo -e "${BLUE}info: ${RED}https://github.com/immisterio/Lampac"
echo -e "${BLUE}connect to Lampac session:"
echo -e " ${YELLOW}tmux attach -t Lampac"
echo -e "${BLUE}change Lampac config:"
echo -e " ${YELLOW}proot-distro login debian -- nano /home/lampac/init.conf"
grep -qF -- '-s Lampac' '.bashrc' || echo 'tmux new-session -d -s Lampac "proot-distro login debian -- bash /root/lampac_updater.sh"'  >> .bashrc
else
sed -i '/-s Lampac/d' .bashrc
fi
#check if Jackett is installed
if proot-distro login debian -- [ -d "/home/Jackett" ];
then
echo ""
echo -e "${BLUE}Jackett running in background ${GREEN}ip:9117"
echo -e "${BLUE}info: ${RED}https://github.com/Jackett/Jackett"
echo -e "${BLUE}connect to Jackett session:"
echo -e " ${YELLOW}tmux attach -t Jackett"
echo -e "${BLUE}change APIKey Jackett:"
echo -e " ${YELLOW}proot-distro login debian -- nano /root/.config/Jackett/ServerConfig.json${NC}"
grep -qF -- '-s Jackett' '.bashrc' || echo 'tmux new-session -d -s Jackett "proot-distro login debian -- /home/Jackett/./jackett"'  >> .bashrc
else
sed -i '/-s Jackett/d' .bashrc
fi

#check if Torrserver is installed
if proot-distro login debian -- [ -d "/home/torrserver" ];
then
echo ""
echo -e "${BLUE}Torrserver running in background ${GREEN}ip:8091"
echo -e "${BLUE}info: ${RED}https://github.com/YouROK/TorrServer"
echo -e "${BLUE}connect to Torrserver session:"
echo -e " ${YELLOW}tmux attach -t Torrserver"
grep -qF -- '-s Torrserver' '.bashrc' || echo 'tmux new-session -d -s Torrserver "proot-distro login debian -- /home/torrserver/torrserver -p 8091"'  >> .bashrc
else
sed -i '/-s Torrserver/d' .bashrc
fi

#check if Midnight Commander is installed
if proot-distro login debian -- [ -d "/etc/mc" ];
then
echo ""
echo -e "${BLUE}run Midnight Commander:"
echo -e "${BLUE}info: ${RED}https://midnight-commander.org/wiki/doc/common/actions"
echo -e " ${YELLOW}proot-distro login debian -- mc"
fi
#check if Vifm is installed
if proot-distro login debian -- [ -d "/usr/share/vifm" ];
then
echo ""
echo -e "${BLUE}run Vifm:"
echo -e "${BLUE}info: ${RED}https://vifm.info/cheatsheets.shtml"
echo -e " ${YELLOW}proot-distro login debian -- vifm"
fi
#command list
echo ""
echo -e "${BLUE}list sessions when you in Tmux:"
echo -e " ${YELLOW}Ctrl+B+S"
echo ""
echo -e "${BLUE}disconnect from session when you in Tmux:"
echo -e " ${YELLOW}Ctrl+B+D"
echo ""
echo -e "${BLUE}stop all sessions and packages:"
echo -e " ${YELLOW}tmux kill-server"
echo ""
echo -e "${BLUE}start Debian for more settings:"
echo -e " ${YELLOW}proot-distro login debian${NC}"

#autorun
sed -i '/bash note.sh/d' .bashrc
sed -i '/bash packages_control.sh/d' .bashrc
cat <<EOT>> .bashrc
bash note.sh
bash packages_control.sh
EOT
#autorun

echo ""
echo -e "${BLUE}packages control to ${GREEN}install ${BLUE}or ${RED}unistall${NC}"
echo -e " ${YELLOW}bash packages_control.sh${NC}"
echo ""
