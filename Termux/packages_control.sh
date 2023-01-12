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
#check if Lampac is installed
if proot-distro login debian -- [ -d "/home/lampac" ]
then
cat <<EOT >> noteT.sh
#LampacStart
echo ""
echo -e "${GREEN}Lampac running in background ip:9118"
echo -e "${RED}about Lampac: https://github.com/immisterio/Lampac"
echo -e "${BLUE}connect to Lampac session:"
echo -e " ${YELLOW}tmux attach -t Lampac"
#LampacEnd
EOT
cat <<EOT >> noteD.sh
#LampacStart
echo""
echo -e "${BLUE}change Lampac config:"
echo -e " ${YELLOW}nano /home/lampac/init.conf"
#LampacEnd
EOT
echo "tmux new-session -s Lampac -d "proot-distro login debian -- bash /root/lampac_updater.sh"" >> ~/.bashrc
fi
#check if Jackett is installed
if proot-distro login debian -- [ -d "/home/Jackett" ]
then
cat <<EOT >> noteT.sh
#JackettStart
echo ""
echo -e "${GREEN}Jackett running in background ip:9117"
echo -e "${RED}about Jackett: https://github.com/Jackett/Jackett"
echo -e "${BLUE}connect to Lampac session:"
echo -e " ${YELLOW}tmux attach -t Jackett"
#JackettEnd
EOT
cat <<EOT >> noteD.sh
#JackettStart
echo""
echo -e "${BLUE}change APIKey Jackett:"
echo -e " ${YELLOW}nano /root/.config/Jackett/ServerConfig.json"
#JackettEnd
EOT
echo "tmux new-session -s Jackett -d "proot-distro login debian -- /home/Jackett/./jackett"" >> ~/.bashrc
fi
#check if Torrserver is installed
if proot-distro login debian -- [ -d "/home/torrserver" ]
then
cat <<EOT >> noteT.sh
#TorrserverStart
echo ""
echo -e "${GREEN}Torrserver running in background ip:8091"
echo -e "${RED}about Torrserver: https://github.com/YouROK/TorrServer"
echo -e "${BLUE}connect to Torrserver session:"
echo -e " ${YELLOW}tmux attach -t Torrserver"
#TorrserverEnd
EOT
echo "tmux new-session -s Jackett -d "proot-distro login debian -- /home/torrserver/torrserver -p 8091"" >> ~/.bashrc
fi
#check if Midnight Commander is installed
if proot-distro login debian -- [ -d "/etc/mc" ]
then
cat <<EOT >> noteT.sh
#MidnightCommanderStart
echo ""
echo -e "${BLUE}run Midnight Commander:"
echo -e " ${YELLOW}proot-distro login debian -- mc"
#MidnightCommanderEnd
EOT
fi
;;

Uninstall)
proot-distro login debian -- curl -s -J -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/Debian/uninstall.sh
proot-distro login debian -- bash uninstall.sh
#check if Lampac is installed
if proot-distro login debian -- [ -d "/home/lampac" ]
then
echo ""
else
sed -i "/#LampacStart/,/#LampacEnd:/d" noteT.sh
sed -i "/#LampacStart/,/#LampacEnd:/d" noteD.sh
sed -i '/-t Lampac/d' .bashrc
fi
#check if Jackett is installed
if proot-distro login debian -- [ -d "/home/Jackett" ]
then
echo ""
else
sed -i "/#JackettStart/,/#JackettEnd:/d" noteT.sh
sed -i "/#JackettStart/,/#JackettEnd:/d" noteD.sh
sed -i '/-t Jackett/d' .bashrc
fi
#check if Torrserver is installed
if proot-distro login debian -- [ -d "/home/torrserver" ]
then
echo ""
else
sed -i "/#TorrserverStart/,/#TorrserverEnd:/d" noteT.sh
sed -i '/-t Torrserver/d' .bashrc
fi
#check if Midnight Commander is installed
if proot-distro login debian -- [ -d "/etc/mc" ]
then
echo ""
else
sed -i "/#MidnightCommanderStart/,/#MidnightCommanderEnd:/d" noteT.sh
fi
;;
Quit)
break
;;
*)
echo -e "${RED}Invalid input $REPLY
${PURPLE}*configuration apply immediately and autorestart after  changes ${GREEN}Install ${NC}or ${RED}Uninstall"
;;
esac
sed -i "/#DebianStart/,/#DebianEnd:/d" noteT.sh
cat <<EOT >> noteT.sh
#DebianStart
echo ""
echo -e "${BLUE}start Debian for more settings:"
echo -e " ${YELLOW}proot-distro login debian"
#DebianEnd
EOT
sed -i "/#GreetingStart/,/#GreetingEnd:/d" .bashrc
cat <<EOT >> .bashrc
#GreetingStart
bash note.sh
bash packages_control.sh
#GreetingEnd
EOT
source ~/.bashrc
exit
done
