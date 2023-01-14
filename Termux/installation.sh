#!/bin/bash
RED='\033[1;31m'
GREEN='\033[1;32m'
#install packages in Termux
pkg install -y tmux proot-distro
proot-distro install debian
#download scripts in Termux
curl -s -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/note.sh
chmod 755 note.sh
curl -s -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/tmux_off.sh
chmod 755 tmux_off.sh
curl -s -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/packages_control.sh
chmod 755 packages_control.sh
#start Debian
proot-distro login debian
#install packages in Debian
apt-get update && apt-get install -y wget libicu67
#clean packages cache Debian
apt-get clean
#exit from Debian
exit
#add scripts to autorun in Termux when it open
echo "pkg autoclean" >> .bashrc
echo "bash tmux_off.sh" >> .bashrc
echo "curl -s -J -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/note.sh" >> .bashrc
echo "curl -s -J -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/packages_control.sh" >> .bashrc
echo "bash note.sh" >> .bashrc
echo "bash packages_control.sh" >> .bashrc
#clean packages cache Termux
pkg clean
#Done
echo ""
echo "#############################################"
echo -e "${GREEN}***####Done####***"
echo -e "${RED}close Termux and open it again!"
echo -e "${GREEN}type to close: ${RED}exit"
