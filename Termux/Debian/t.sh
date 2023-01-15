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
############################ Make scripts for install in Debian
cd $HOME/debian/root/updater
############################ Lampac
cat <<\EOF> lampac.sh
#!/bin/bash
#install ASP.NET for Lampac
wget https://dot.net/v1/dotnet-install.sh
chmod 755 dotnet-install.sh
bash dotnet-install.sh --runtime aspnetcore --channel 6.0 --install-dir /usr/share/dotnet
ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet
rm dotnet-install.sh
#install Lampac
wget https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/Debian/lampac_updater.sh
chmod 755 lampac_updater.sh
#install Lampac
cd /home
mkdir lampac
cd /home/lampac
gitver=$(curl -s https://api.github.com/repos/immisterio/Lampac/releases/latest | grep tag_name | sed s/[^0-9]//g)
echo -n $gitver > vers.txt
wget https://github.com/immisterio/Lampac/releases/latest/download/publish.zip
unzip -o publish.zip
rm -f publish.zip
wget https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/Debian/update.sh
cp example.conf init.conf
chmod 755 -R /home/lampac
EOF
############################ Lampac

############################ Jackett
cat <<\EOF> jackett.sh
#!/bin/bash
VER="$(uname -m | grep aarch64)"

if [[ "$VER" == "aarch64" ]];
then
cd /home
wget https://github.com/Jackett/Jackett/releases/latest/download/Jackett.Binaries.LinuxARM64.tar.gz
tar -xvf Jackett.Binaries.LinuxARM64.tar.gz
rm Jackett.Binaries.LinuxARM64.tar.gz
chmod 755 -R /home/Jackett
else
cd /home
wget https://github.com/Jackett/Jackett/releases/latest/download/Jackett.Binaries.LinuxARM32.tar.gz
tar -xvf Jackett.Binaries.LinuxARM32.tar.gz
rm Jackett.Binaries.LinuxARM32.tar.gz
chmod 755 -R /home/Jackett
fi
EOF
############################ Jackett

############################ Torrserver 111OE
cat <<\EOF> torrserver111.sh
#!/bin/bash
VER="$(uname -m | grep aarch64)"

if [[ "$VER" == "aarch64" ]];
then
cd /home
mkdir torrserver_config
mkdir torrserver
cd /home/torrserver
wget https://www.dropbox.com/s/7kos493fhikfs74/111OE_TorrServer-android-arm64
mv 111OE_TorrServer-android-arm64 torrserver
echo -n 111OE > vers.txt
chmod 755 -R /home/torrserver
else
cd /home
mkdir torrserver_config
mkdir torrserver
cd /home/torrserver
wget https://www.dropbox.com/s/yu2pyewdndcex5i/111OE_TorrServer-android-arm7
mv 111OE_TorrServer-android-arm7 torrserver
echo -n 111OE > vers.txt
chmod 755 -R /home/torrserver
fi
EOF
############################ Torrserver 111OE

############################ Torrserver 118OE
cat <<\EOF> torrserver118.sh
#!/bin/bash
VER="$(uname -m | grep aarch64)"

if [[ "$VER" == "aarch64" ]];
then
cd /home
mkdir torrserver_config
mkdir torrserver
cd /home/torrserver
wget https://www.dropbox.com/s/tt5i6lvm2mjsi1g/118OE_TorrServer-android-arm64
mv 118OE_TorrServer-android-arm64 torrserver
echo -n 118OE > vers.txt
chmod 755 -R /home/torrserver
else
cd /home
mkdir torrserver_config
mkdir torrserver
cd /home/torrserver
wget https://www.dropbox.com/s/r7u8f13didnkatz/118OE_TorrServer-android-arm7
mv 118OE_TorrServer-android-arm7 torrserver
echo -n 118OE > vers.txt
chmod 755 -R /home/torrserver
fi
EOF
############################ Torrserver 118OE

############################ Torrserver latest
cat <<\EOF> torrserver.sh
#!/bin/bash
VER="$(uname -m | grep aarch64)"
torrserver_git_ver="$(curl -s https://api.github.com/repos/YouROK/TorrServer/releases/latest | grep tag_name | sed s/[^0-9]//g)"
if [[ "$VER" == "aarch64" ]];
then
cd /home
mkdir torrserver_config
mkdir torrserver
cd /home/torrserver
wget https://github.com/YouROK/TorrServer/releases/latest/download/TorrServer-android-arm64
mv TorrServer-android-arm64 torrserver
echo -n $torrserver_git_ver > vers.txt
chmod 755 -R /home/torrserver
else
cd /home
mkdir torrserver_config
mkdir torrserver
cd /home/torrserver
wget https://github.com/YouROK/TorrServer/releases/latest/download/TorrServer-android-arm7
mv TorrServer-android-arm7 torrserver
echo -n $torrserver_git_ver > vers.txt
chmod 755 -R /home/torrserver
fi
EOF
############################ Torrserver latest

cd $HOME
cat <<\EOF> install.sh
#!/bin/bash
VER="$(uname -m | grep aarch64)"
torrserver_git_ver="$(curl -s https://api.github.com/repos/YouROK/TorrServer/releases/latest | grep tag_name | sed s/[^0-9]//g)"
cmd=(dialog --separate-output --title "$TITLE" --cancel-label "Exit" --checklist "Choose packages to install\nPress spacebar to select multiple" 22 76 16)
packages=(1 "Lampac" off
          2 "Jackett" off
          3 "Torrserver 111 OE" off
          4 "Torrserver 118 OE" off
          5 "Torrserver ${torrserver_git_ver} (latest)" off
          6 "Midnight Commander" off
          7 "Vifm" off )

choices=$("${cmd[@]}" "${packages[@]}" 2>&1 >/dev/tty)

for choice in $choices
do
case $choice in
1)
#install Lampac
proot-distro login debian -- bash /root/updater/lampac.sh
wait $!
#check if Lampac is installed
if proot-distro login debian -- [ -d "/home/lampac" ];
then
grep -qF -- '-s Lampac' '.bashrc' || echo 'tmux new-session -d -s Lampac "proot-distro login debian -- bash /root/lampac_updater.sh"'  >> .bashrc
fi
;;

2)
#install Jackett
proot-distro login debian -- bash /root/updater/jackett.sh
wait $!
#check if Jackett is installed
if proot-distro login debian -- [ -d "/home/Jackett" ];
then
grep -qF -- '-s Jackett' '.bashrc' || echo 'tmux new-session -d -s Jackett "proot-distro login debian -- /home/Jackett/./jackett"'  >> .bashrc
fi
;;
3)
#install Torrserver 111 OE
proot-distro login debian -- bash /root/updater/torrserver111.sh
wait $!
#check if Torrserver is installed
if proot-distro login debian -- [ -d "/home/torrserver" ];
then
grep -qF -- '-s Torrserver' '.bashrc' || echo 'tmux new-session -d -s Torrserver "proot-distro login debian -- /home/torrserver/torrserver -p 8091 -a -k -d /home/torrserver_config"'  >> .bashrc
fi
;;
4)
#install Torrserver 118 OE
proot-distro login debian -- bash /root/updater/torrserver118.sh
wait $!
#check if Torrserver is installed
if proot-distro login debian -- [ -d "/home/torrserver" ];
then
grep -qF -- '-s Torrserver' '.bashrc' || echo 'tmux new-session -d -s Torrserver "proot-distro login debian -- /home/torrserver/torrserver -p 8091 -a -k -d /home/torrserver_config"'  >> .bashrc
fi
;;
5)
#install Torrserver latest
proot-distro login debian -- bash /root/updater/torrserver.sh
wait $!
#check if Torrserver is installed
if proot-distro login debian -- [ -d "/home/torrserver" ];
then
grep -qF -- '-s Torrserver' '.bashrc' || echo 'tmux new-session -d -s Torrserver "proot-distro login debian -- /home/torrserver/torrserver -p 8091 -a -k -d /home/torrserver_config"'  >> .bashrc
fi
;;
6)
#install Midnight Commander
apt install mc -y
;;
7)
#install Vifm
apt install vifm -y
;;
esac
done
clear
EOF
bash install.sh
rm $HOME/debian/root/updater*
rm install.sh

;;
Uninstall)
cat <<\EOF> uninstall.sh
#!/bin/bash
torrserver_ver="$(cat /home/torrserver/vers.txt)"
packages=(1 "remove Lampac"
          2 "remove Jackett (save config for future)"
          3 "remove Jackett"
          4 "remove Torrserver ${torrserver_ver}"
          5 "remove Midnight Commander"
          6 "remove Vifm")

while choice=$(dialog --title "$TITLE" --cancel-label "Exit" \
                      --menu "Choose packages to remove" 20 50 50 "${packages[@]}" \
                      2>&1 >/dev/tty)

do
case $choice in
1)
killall dotnet
#remove ASP.NET
rm /usr/bin/dotnet
rm -R /usr/share/dotnet*
#remove Lampac
rm lampac_updater.sh
rm -R /home/lampac*
;;
#remove Jackett with saving config (if you install it in the future)
2)
killall jackett
rm -R /home/Jackett*
;;
#remove all Jackett
3)
killall jackett
rm -R /home/Jackett*
rm -R /root/.config/Jackett*
;;
#remove all Torrserver
4)
killall torrserver
rm -R /home/torrserver*
rm /root/config.db
;;
#remove Midnight Commander
5)
apt-get purge mc -y
;;
#remove Vifm
6)
apt-get purge vifm -y
;;
esac
done
clear
EOF
bash uninstall.sh
wait $!
rm uninstall.sh
;;
Quit)
break
;;
*)
echo -e "${RED}Invalid input $REPLY
${PURPLE}*configuration apply immediately and autorestart after  changes ${GREEN}Install ${NC}or ${RED}Uninstall"
;;
esac
echo -e "${NC}${GREEN}***####Done####***"
echo -e "${RED}close Termux and open it again to apply changes!"
echo -e "${GREEN}type to close: ${RED}exit${NC}"
bash .bashrc
exit
done
