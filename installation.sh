#!/bin/bash
#install packages in Termux
pkg install -y tmux proot-distro
proot-distro install debian
#download scripts in Termux
curl -s -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/note.sh
chmod 755 note.sh
curl -s -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/cronT.sh
chmod 755 cronT.sh
curl -s -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/tmux_off.sh
chmod 755 tmux_off.sh
curl -s -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/packages_control.sh
chmod 755 packages_control.sh
#start Debian
proot-distro login debian
#install packages in Debian
apt-get update && apt-get install -y wget libicu67
curl -s -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/cronD.sh
chmod 755 cronD.sh
cat <<EOT >> .bashrc
cronD.sh
EOT
#exit from Debian
exit
#add scripts to autorun in Termux when it open
cat <<EOT >> .bashrc
cronT.sh
bash tmux_off.sh
#GreetingStart
bash note.sh
bash packages_control.sh
#GreetingEnd
EOT
#start autorun
bash packages_control.sh
