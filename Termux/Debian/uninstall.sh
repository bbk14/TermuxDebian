#!/bin/bash
torrserver_ver="$(cat /home/torrserver/vers.txt)"
packages=(1 "Lampac"
          2 "Jackett (save config for future)"
          3 "Jackett remove all"
          4 "Torrserver ${torrserver_ver}"
          5 "Midnight Commander")

while choice=$(dialog --title "$TITLE" --cancel-label "Exit" \
                      --menu "Choose packages to remove" 20 50 50 "${packages[@]}" \
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
#remove all Torrserver
4)
rm -R /home/torrserver*
rm /root/config.db
;;
#remove Midnight Commander
5)
apt-get purge mc -y
apt-get clean
;;

esac
done
clear
