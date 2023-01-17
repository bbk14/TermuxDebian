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
if proot-distro login debian -- [ -f "/home/lampac/Lampac.dll" ];
then
echo ""
echo -e "${BLUE}Lampac running in background ${GREEN}ip:9118"
echo -e "${BLUE}info: ${RED}https://github.com/immisterio/Lampac"
echo -e "${BLUE}change Lampac config:"
echo -e " ${YELLOW}proot-distro login debian -- nano /home/lampac/init.conf"
fi
#check if Jackett is installed
if proot-distro login debian -- [ -d "/home/Jackett" ];
then
echo ""
echo -e "${BLUE}Jackett running in background ${GREEN}ip:9117"
echo -e "${BLUE}info: ${RED}https://github.com/Jackett/Jackett"
echo -e "${BLUE}change APIKey Jackett:"
echo -e " ${YELLOW}proot-distro login debian -- nano /root/.config/Jackett/ServerConfig.json${NC}"
fi
#check if Torrserver is installed
if proot-distro login debian -- [ -d "/home/torrserver" ];
then
echo ""
echo -e "${BLUE}Torrserver running in background ${GREEN}ip:8091"
echo -e "${BLUE}info: ${RED}https://github.com/YouROK/TorrServer"
fi
#check if Tor proxy is installed
if [ -d "$PREFIX/etc/tor" ];
then
echo ""
echo -e "${BLUE}Tor proxy SOCKS5 running in background ${GREEN}ip:9050"
echo -e "${BLUE}info: ${RED}https://support.torproject.org/glossary/proxy/"
fi
#check if Midnight Commander is installed
if [ -d "$PREFIX/etc/mc" ];
then
echo ""
echo -e "${BLUE}Midnight Commander:"
echo -e "${BLUE}info: ${RED}https://midnight-commander.org/wiki/doc/common/actions"
echo -e "${BLUE}run in Termux Home folder:"
echo -e " ${YELLOW}mc"
echo -e "${BLUE}run in Termux System folder:"
echo -e " ${YELLOW}cd $PREFIX && mc"
echo -e "${BLUE}run in Debian System folder:"
echo -e " ${YELLOW}cd $HOME/debian/ && mc"
fi
#check if Vifm is installed
if [ -d "$PREFIX/etc/vifm" ];
then
echo ""
echo -e "${BLUE}run Vifm:"
echo -e "${BLUE}info: ${RED}https://vifm.info/cheatsheets.shtml"
echo -e "${BLUE}run in Termux Home folder:"
echo -e " ${YELLOW}vifm"
echo -e "${BLUE}run in Termux System folder:"
echo -e " ${YELLOW}cd $PREFIX && vifm"
echo -e "${BLUE}run in Debian System folder:"
echo -e " ${YELLOW}cd $HOME/debian/ && vifm"
fi
#command list
echo ""
echo -e "${BLUE}connect to packages that runs in background Tmux:"
echo -e " ${YELLOW}tmux attach -t pac"
echo ""
echo -e "${BLUE}list packages when you in Tmux:"
echo -e " ${YELLOW}Ctrl+B+S  then arrows"
echo -e "${BLUE}or"
echo -e " ${YELLOW}Ctrl+B  then arrows"
echo ""
echo -e "${BLUE}disconnect from session when you in Tmux:"
echo -e " ${YELLOW}Ctrl+B+D"
echo ""
echo -e "${BLUE}stop all sessions and packages:"
echo -e " ${YELLOW}tmux kill-server"
echo ""
echo -e "${BLUE}start Debian for more settings:"
echo -e " ${YELLOW}proot-distro login debian${NC}"

echo ""
echo -e "${BLUE}packages control to ${GREEN}install ${BLUE}or ${RED}unistall${NC}"
echo -e " ${YELLOW}bash packages.sh${NC}"
echo ""
