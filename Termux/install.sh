#!/bin/bash
#Color
RED='\033[1;31m'
GREEN='\033[1;32m'
NONE='\033[0m'

PS3="Choose packages to install: "

torrserver_git_ver="$(https://api.github.com/repos/YouROK/TorrServer/releases/latest | grep tag_name | sed s/[^0-9]//g)"

select packages in Lampac Jackett Torrserver:111OE Torrserver:118OE Torrserver:$torrserver_git_ver Quit; do
case $packages in
Lampac)
if proot-distro login debian -- [ -d "/home/lampac" ]
then
echo "${GREEN}Lampac already installed $lampac_ver ${NONE}"
echo "${RED}Uninstall it first in uninstall.sh${NONE}"
else
proot-distro login debian
#install ASP.NET for Lampac
wget https://dot.net/v1/dotnet-install.sh
chmod 755 dotnet-install.sh
bash dotnet-install.sh --runtime aspnetcore --channel 6.0 --install-dir /usr/share/dotnet
ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet
#install Lampac
wget https://raw.githubusercontent.com/bbk14/Termux-Debian-Lampac-Jackett/main/lampac.sh
chmod 755 lampac.sh
#
cd /home
mkdir lampac
cd /home/lampac
gitver=$(curl -s https://api.github.com/repos/immisterio/Lampac/releases/latest | grep tag_name | sed s/[^0-9]//g)
echo -n $gitver > vers.txt
wget https://github.com/immisterio/Lampac/releases/latest/download/publish.zip
unzip -o publish.zip
rm -f publish.zip
wget https://raw.githubusercontent.com/bbk14/Termux-Debian-Lampac-Jackett/main/update.sh
chmod 755 update.sh
cp example.conf init.conf
exit
fi
;;
Torrserver:111OE)

;;

Torrserver:118OE)

;;

Torrserver:$torrserver_git_ver
if proot-distro login debian -- [ -d "/home/torrserver" ]
then
echo "${GREEN}Torrserver already installed $torrserver_ver ${NONE}"
echo "${RED}Uninstall it first in uninstall.sh${NONE}"
else
proot-distro login debian
cd /home
mkdir torrserver
cd /home/torrserver
wget https://github.com/YouROK/TorrServer/releases/latest/download/TorrServer-android-arm64
mv TorrServer-android-arm64 torrserver
echo "$torrserver_git_ver" > ver.txt
chmod 755 torrserver
chmod 755 config.db
exit
fi
;;
Quit)
break
;;
*) 
echo "Invalid choose $REPLY"
;;
esac
done
rm install.sh
