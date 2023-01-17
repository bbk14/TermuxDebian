#!/bin/bash
RED='\033[1;31m'
GREEN='\033[1;32m'
#install packages in Termux
pkg install tmux htop proot-distro -y
proot-distro install debian
#download scripts in Termux
curl -s -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/note.sh
chmod 755 note.sh
curl -s -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/tmux_off.sh
chmod 755 tmux_off.sh
curl -s -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/packages.sh
chmod 755 packages.sh
#start Debian
proot-distro login debian
#install packages in Debian
apt-get update && apt-get install -y wget libicu67
#clean packages cache Debian
apt-get clean
cd /home
mkdir updater
mkdir config
chmod 755 -R /home/updater
chmod 755 -R /home/config
#exit from Debian
exit
ln -s /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/debian/ debian
#add scripts to autorun in Termux when it open
cat <<EOF>> pac.sh
bash note.sh
bash packages.sh
EOF
chmod 755 pac.sh
cat <<\EOF>> .bashrc
pkg clean
bash tmux_off.sh
curl -s -J -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/note.sh
curl -s -J -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/packages.sh
tmux new-session -d -s pac bash pac.sh
tmux select-layout -t pac tiled
tmux split-window -h -p 70 -t pac:0 htop
bash note.sh
bash packages.sh
EOF
#clean packages cache Termux
pkg clean
#start install packages
source ~/.bashrc
