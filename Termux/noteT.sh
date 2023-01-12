#!/bin/bash
GREEN='\033[1;32m'
BLUE='\033[1;36m'
YELLOW='\033[1;33m'
PURPLE='\033[0;35m'
NC='\033[0m'
echo -e "${GREEN}Termux input commands:"
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
#DebianStart
echo ""
echo -e "${BLUE}start Debian for more settings:"
echo -e " ${YELLOW}proot-distro login debian"
#DebianEnd
