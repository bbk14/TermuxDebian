#!/bin/bash
RED='\033[1;31m'
GREEN='\033[1;32m'
#install packages in Termux
chmod 777 -R $HOME/torrserver
chmod 777 -R $HOME/config/torrserver
mkdir $HOME/config/torrserver
mkdir $HOME/torrserver
cd $HOME/torrserver
curl -s -O https://www.dropbox.com/s/r7u8f13didnkatz/118OE_TorrServer-android-arm7
mv 118OE_TorrServer-android-arm7 torrserver
echo -n 118OE > vers.txt
chmod 777 -R $HOME/torrserver
chmod 777 -R $HOME/config/torrserver

cat <<\EOF>> .bashrc
pkg clean
$HOME/torrserver/torrserver -p 8091 -a -d $HOME/config/torrserver
EOF

#clean packages cache Termux
pkg clean
#Done
echo ""
echo "#############################################"
echo -e "${GREEN}***####Done####***"
echo -e "${RED}close Termux and open it again to apply changes!"
echo -e "${GREEN}type to close: ${RED}exit${NC}"
