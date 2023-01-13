#!/bin/bash
VER="$(uname -m | grep aarch64)"
torrserver_git_ver="$(curl -s https://api.github.com/repos/YouROK/TorrServer/releases/latest | grep tag_name | sed s/[^0-9]//g)"
packages=(1 "Lampac"
          2 "Jackett"
          3 "Torrserver 111 OE"
          4 "Torrserver 118 OE"
          5 "Torrserver ${torrserver_git_ver}(latest)"
          6 "Midnight Commander")

while choice=$(dialog --title "$TITLE" \
                      --clear \
                      --cancel-label "Exit" \  
                      --menu "Choose packages to install" 20 50 50 "${packages[@]}" \
                      2>&1 >/dev/tty)

do
case $choice in
1)
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
;;
#install Jackett
2)
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
;;
#install Torrserver 111 OE
3)
if [[ "$VER" == "aarch64" ]];
then
cd /home
mkdir torrserver
cd /home/torrserver
wget https://www.dropbox.com/s/7kos493fhikfs74/111OE_TorrServer-android-arm64
mv 111OE_TorrServer-android-arm64 torrserver
echo -n 111OE > vers.txt
chmod 755 -R /home/torrserver
else
cd /home
mkdir torrserver
cd /home/torrserver
wget https://www.dropbox.com/s/yu2pyewdndcex5i/111OE_TorrServer-android-arm7
mv 111OE_TorrServer-android-arm7 torrserver
echo -n 111OE > vers.txt
chmod 755 -R /home/torrserver
fi
;;
#install Torrserver 118 OE
4)
if [[ "$VER" == "aarch64" ]];
then
cd /home
mkdir torrserver
cd /home/torrserver
wget https://www.dropbox.com/s/tt5i6lvm2mjsi1g/118OE_TorrServer-android-arm64
mv 118OE_TorrServer-android-arm64 torrserver
echo -n 118OE > vers.txt
chmod 755 -R /home/torrserver
else
cd /home
mkdir torrserver
cd /home/torrserver
wget https://www.dropbox.com/s/r7u8f13didnkatz/118OE_TorrServer-android-arm7
mv 118OE_TorrServer-android-arm7 torrserver
echo -n 118OE > vers.txt
chmod 755 -R /home/torrserver
fi
;;
#install Torrserver latest
5)
if [[ "$VER" == "aarch64" ]];
then
cd /home
mkdir torrserver
cd /home/torrserver
wget https://github.com/YouROK/TorrServer/releases/latest/download/TorrServer-android-arm64
mv TorrServer-android-arm64 torrserver
echo -n $torrserver_git_ver > vers.txt
chmod 755 -R /home/torrserver
else
cd /home
mkdir torrserver
cd /home/torrserver
wget https://github.com/YouROK/TorrServer/releases/latest/download/TorrServer-android-arm7
mv TorrServer-android-arm7 torrserver
echo -n $torrserver_git_ver > vers.txt
chmod 755 -R /home/torrserver
fi
;;
#install Midnight Commander
6)
apt-get install mc -y
;;

esac
exit
done
clear
