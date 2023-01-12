#!/bin/bash
torrserver_ver="$(cat /home/torrserver/vers.txt)"
packages=(1 "Lampac"
          2 "Jackett with saving config"
          3 "Jackett remove all"
          4 "Torrserver ${torrserver_ver} with saving database"
          5 "Torrserver ${torrserver_ver} remove all"
          6 "Midnight Commander")

while choice=$(dialog --title "$TITLE" \
                 --menu "Choose packages to remove" 10 40 3 "${packages[@]}" \
                 2>&1 >/dev/tty)

do
case $choice in
1)
#remove ASP.NET
rm /usr/bin/dotnet
rm -R /usr/share/dotnet*
#remove Lampac
rm lampac_updater.sh
rm -R /home/lampac*
;;
#remove Jackett with saving config (if you install it in the future)
2)
rm -R /home/Jackett*
;;
#remove all Jackett
3)
rm -R /home/Jackett*
rm -R /root/.config/Jackett*
;;
#remove Torrserver with saving database (if you change version)
4)
rm /home/torrserver/torrserver
;;
#remove all Torrserver
5)
rm -R /home/torrserver*
;;
#remove Midnight Commander
6)
apt-get purge mc -y
;;

esac
done
clear
