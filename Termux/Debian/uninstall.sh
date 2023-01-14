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
