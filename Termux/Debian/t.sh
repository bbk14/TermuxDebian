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
cd $HOME/debian/home/updater
############################ Lampac inststall start
cat <<\EOF> lampac.sh
#!/bin/bash
#install ASP.NET for Lampac
wget https://dot.net/v1/dotnet-install.sh
chmod 755 dotnet-install.sh
bash dotnet-install.sh --runtime aspnetcore --channel 6.0 --install-dir /usr/share/dotnet
ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet
rm dotnet-install.sh
#install Lampac
cd /home
wget https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/Debian/lampac_updater.sh
chmod 755 lampac_updater.sh
#install Lampac
mkdir lampac
cd /home/lampac
gitver=$(curl -s https://api.github.com/repos/immisterio/Lampac/releases/latest | grep tag_name | sed s/[^0-9]//g)
echo -n $gitver > vers.txt
wget https://github.com/immisterio/Lampac/releases/latest/download/publish.zip
unzip -o publish.zip
rm -f publish.zip
wget https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/Debian/update.sh
if [ -f "/home/lampac/intit.conf" ];
then
echo ""
else
cp example.conf init.conf
fi
chmod 755 -R /home/lampac
EOF
############################ Lampac inststall end

############################ Jackett inststall start
cat <<\EOF> jackett.sh
#!/bin/bash
jackett_git_ver="$(curl -s https://api.github.com/repos/Jackett/Jackett/releases/latest | grep tag_name | sed s/[^.0-9]//g)"
VER="$(uname -m | grep aarch64)"

if [[ "$VER" == "aarch64" ]];
then
cd /home
wget https://github.com/Jackett/Jackett/releases/latest/download/Jackett.Binaries.LinuxARM64.tar.gz
tar -xvf Jackett.Binaries.LinuxARM64.tar.gz
rm Jackett.Binaries.LinuxARM64.tar.gz
echo -n $jackett_git_ver > vers.txt
chmod 755 -R /home/Jackett
else
cd /home
wget https://github.com/Jackett/Jackett/releases/latest/download/Jackett.Binaries.LinuxARM32.tar.gz
tar -xvf Jackett.Binaries.LinuxARM32.tar.gz
rm Jackett.Binaries.LinuxARM32.tar.gz
echo -n $jackett_git_ver > vers.txt
chmod 755 -R /home/Jackett
fi
EOF
############################ Jackett inststall end

############################ Torrserver 111OE inststall start
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
chmod 755 -R /home/torrserver_config
else
cd /home
mkdir torrserver_config
mkdir torrserver
cd /home/torrserver
wget https://www.dropbox.com/s/yu2pyewdndcex5i/111OE_TorrServer-android-arm7
mv 111OE_TorrServer-android-arm7 torrserver
echo -n 111OE > vers.txt
chmod 755 -R /home/torrserver
chmod 755 -R /home/torrserver_config
fi
EOF
############################ Torrserver 111OE inststall end

############################ Torrserver 118OE inststall start
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
chmod 755 -R /home/torrserver_config
else
cd /home
mkdir torrserver_config
mkdir torrserver
cd /home/torrserver
wget https://www.dropbox.com/s/r7u8f13didnkatz/118OE_TorrServer-android-arm7
mv 118OE_TorrServer-android-arm7 torrserver
echo -n 118OE > vers.txt
chmod 755 -R /home/torrserver
chmod 755 -R /home/torrserver_config
fi
EOF
############################ Torrserver 118OE inststall end

############################ Torrserver latest inststall start
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
chmod 755 -R /home/torrserver_config
else
cd /home
mkdir torrserver_config
mkdir torrserver
cd /home/torrserver
wget https://github.com/YouROK/TorrServer/releases/latest/download/TorrServer-android-arm7
mv TorrServer-android-arm7 torrserver
echo -n $torrserver_git_ver > vers.txt
chmod 755 -R /home/torrserver
chmod 755 -R /home/torrserver_config
fi
EOF
############################ Torrserver latest inststall end

cd $HOME
cat <<\EOF> install.sh
#!/bin/bash
VER="$(uname -m | grep aarch64)"
lampac_git_ver="$(curl -s https://api.github.com/repos/immisterio/Lampac/releases/latest | grep tag_name | sed s/[^0-9]//g)"
jackett_git_ver="$(curl -s https://api.github.com/repos/Jackett/Jackett/releases/latest | grep tag_name | sed s/[^.0-9]//g)"
torrserver_git_ver="$(curl -s https://api.github.com/repos/YouROK/TorrServer/releases/latest | grep tag_name | sed s/[^0-9]//g)"
cmd=(dialog --separate-output --title "$TITLE" --cancel-label "Exit" --checklist "Choose packages to Install:\n*Press space to select multiple" 22 76 16)
packages=(1 "Lampac $lampac_git_ver (latest)" off
          2 "Jackett $jackett_git_ver (latest)" off
          3 "Torrserver 111 OE" off
          4 "Torrserver 118 OE" off
          5 "Torrserver $torrserver_git_ver (latest)" off
          6 "Tor proxy - SOCKS5" off
          7 "Midnight Commander" off
          8 "Vifm" off )

choices=$("${cmd[@]}" "${packages[@]}" 2>&1 >/dev/tty)

for choice in $choices
do
case $choice in
1)
#install Lampac
proot-distro login debian -- bash /home/updater/lampac.sh
#check if Lampac is installed
if proot-distro login debian -- [ -f "/home/lampac/Lampac.dll" ];
then
grep -qF -- 'lampac' '.bashrc' || echo 'tmux split-window -v -p 100 -t pac:0 "proot-distro login debian -- bash /home/lampac_updater.sh"'  >> .bashrc
fi
;;

2)
#install Jackett
proot-distro login debian -- bash /home/updater/jackett.sh
#check if Jackett is installed
if proot-distro login debian -- [ -d "/home/Jackett" ];
then
grep -qF -- 'jackett' '.bashrc' || echo 'tmux split-window -v -p 100 -t pac:0 "proot-distro login debian -- /home/Jackett/./jackett"'  >> .bashrc
fi
;;
3)
#install Torrserver 111 OE
proot-distro login debian -- bash /home/updater/torrserver111.sh
#check if Torrserver is installed
if proot-distro login debian -- [ -d "/home/torrserver" ];
then
grep -qF -- 'torrserver' '.bashrc' || echo 'tmux split-window -v -p 100 -t pac:0 "proot-distro login debian -- /home/torrserver/torrserver -p 8091 -a -d /home/torrserver_config"'  >> .bashrc
fi
;;
4)
#install Torrserver 118 OE
proot-distro login debian -- bash /home/updater/torrserver118.sh
#check if Torrserver is installed
if proot-distro login debian -- [ -d "/home/torrserver" ];
then
grep -qF -- 'torrserver' '.bashrc' || echo 'tmux split-window -v -p 100 -t pac:0 "proot-distro login debian -- /home/torrserver/torrserver -p 8091 -a -d /home/torrserver_config"'  >> .bashrc
fi
;;
5)
#install Torrserver latest
proot-distro login debian -- bash /home/updater/torrserver.sh
#check if Torrserver is installed
if proot-distro login debian -- [ -d "/home/torrserver" ];
then
grep -qF -- 'torrserver' '.bashrc' || echo 'tmux split-window -v -p 100 -t pac:0 "proot-distro login debian -- /home/torrserver/torrserver -p 8091 -a -d /home/torrserver_config"'  >> .bashrc
fi
;;
6)
#install Tor proxy
pkg update && pkg install -y tor
pkg clean
;;
7)
#install Midnight Commander
pkg install -y mc
pkg clean
;;
8)
#install Vifm
pkg install -y vifm
pkg clean
;;
esac
done
clear
EOF
bash install.sh
cd $HOME/debian/home/
rm updater/*
cd $HOME
rm install.sh

;;
Uninstall)

cat <<\EOF> uninstall.sh
#!/bin/bash
lampac_ver="$(cat /home/lampac/vers.txt)"
jackett_ver="$(cat /home/Jackett/vers.txt)"
torrserver_ver="$(cat /home/torrserver/vers.txt)"
cmd=(dialog --separate-output --title "$TITLE" --cancel-label "Exit" --checklist "Choose packages to Uninstall:\n*Press space to select multiple" 22 76 16)
packages=(1 "Lampac $lampac_ver" off
          2 "Lampac $lampac_ver (save config)" off
          3 "Jackett $jackett_ver" off
          4 "Jackett $jackett_ver (save config)" off
          5 "Torrserver ${torrserver_ver}" off
          6 "Torrserver ${torrserver_ver} (save config)" off
          7 "Tor proxy" off
          8 "Midnight Commander" off
          9 "Vifm" off)

choices=$("${cmd[@]}" "${packages[@]}" 2>&1 >/dev/tty)

for choice in $choices

do
case $choice in
1)
proot-distro login debian -- killall dotnet
cd $HOME/debian/home/
rm -R lampac*
rm lampac_updater.sh
sed -i '/lampac/d' ~/.bashrc
;;
2)
proot-distro login debian -- killall dotnet
cd $HOME/debian/home/lampac/
rm -R -v !("init.conf")
cd $HOME/debian/home/
rm lampac_updater.sh
sed -i '/lampac/d' ~/.bashrc
;;
3)
proot-distro login debian -- killall jackett
cd $HOME/debian/home/
rm -R Jackett*
cd $HOME/debian/root/
rm -R /.config/Jackett*
sed -i '/jackett/d' ~/.bashrc
;;
4)
proot-distro login debian -- killall jackett
cd $HOME/debian/home/
rm -R Jackett*
sed -i '/jackett/d' ~/.bashrc
;;
5)
proot-distro login debian -- killall torrserver
cd $HOME/debian/home/
rm -R torrserver*
sed -i '/torrserver/d' ~/.bashrc
;;
6)
proot-distro login debian -- killall torrserver
cd $HOME/debian/home/
rm -R torrserver*
rm -R torrserver_config*
sed -i '/torrserver/d' ~/.bashrc
;;
7)
killall tor
apt autoclean -y tor
pkg clean
;;
8)
killall mc
apt autoclean -y mc
pkg clean
;;
9)
killall vifm
apt autoclean vifm -y
pkg clean
;;
esac
done
clear
EOF
bash uninstall.sh
cd $HOME/debian/home/
rm updater/*
cd $HOME
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
#autorun
sed -i '/bash note.sh/d' .bashrc
sed -i '/bash packages.sh/d' .bashrc
cat <<EOT>> .bashrc
bash note.sh
bash packages.sh
EOT
#autorun
bash .bashrc
exit
done