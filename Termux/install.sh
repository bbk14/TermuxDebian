#!/bin/bash

packages=(1 "Lampac"
          2 "Jackett"
          3 "Torrserver 111 OE"
          4 "Torrserver 118 OE"
          5 "Torrserver latest"
          6 "Midnight Commander")

while choice=$(dialog --title "$TITLE" \
                 --menu "Choose packages to install" 10 40 3 "${packages[@]}" \
                 2>&1 >/dev/tty)

do
case $choice in
1)
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
;;

2)

;;

3)

;;

4)
echo ""
;;
5)
cd /home
mkdir torrserver
cd /home/torrserver
wget https://github.com/YouROK/TorrServer/releases/latest/download/TorrServer-android-arm64
mv TorrServer-android-arm64 torrserver
torrserver_git_ver="$(curl -s https://api.github.com/repos/YouROK/TorrServer/releases/latest | grep tag_name | sed s/[^0-9]//g)"
echo -n $torrserver_git_ver > ver.txt
chmod 755 torrserver
chmod 755 config.db
;;

6)

;;


esac
done
clear
