#!/bin/bash
#Color
RED='\033[1;31m'
GREEN='\033[1;32m'
NONE='\033[0m'

PS3="Choose packages to install: "

select packages in Lampac Jackett Torrserver_111OE Torrserver_118OE Torrserver_latest Quit; do
case $packages in
Lampac)
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
;;
Torrserver_111OE)
echo ""
;;

Torrserver_118OE)
echo ""
;;
Torrserver_latest)
proot-distro login debian
cd /home
mkdir torrserver
cd /home/torrserver
wget https://github.com/YouROK/TorrServer/releases/latest/download/TorrServer-android-arm64
mv TorrServer-android-arm64 torrserver
torrserver_git_ver="$(https://api.github.com/repos/YouROK/TorrServer/releases/latest | grep tag_name | sed s/[^0-9]//g)"
echo "$torrserver_git_ver" > ver.txt
chmod 755 torrserver
chmod 755 config.db
exit
;;
Quit)
break
;;
*) 
echo "Invalid choose $REPLY"
;;
esac
done
