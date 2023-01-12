#!/bin/bash
#install packages in Termux
pkg install -y tmux proot-distro
proot-distro install debian
#download scripts in Termux
curl -s -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/note.sh
chmod 755 note.sh
curl -s -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/noteT.sh
chmod 755 noteT.sh
curl -s -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/noteD.sh
chmod 755 noteD.sh
curl -s -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/tmux_off.sh
chmod 755 tmux_off.sh
curl -s -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/packages_control.sh
chmod 755 packages_control.sh
#start Debian
proot-distro login debian
#install packages in Debian
apt-get update && apt-get install -y wget libicu67
#exit from Debian
exit
#add scripts to autorun in Termux when it open
cat <<EOT >> .bashrc
curl -s -J -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/packages_control.sh
bash tmux_off.sh
#GreetingStart
bash note.sh
bash packages_control.sh
#GreetingEnd
EOT
#Done
echo "Done"
echo "close Termux and open it again"
