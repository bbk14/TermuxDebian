#!/bin/bash
#
pkg install -y tmux proot-distro
proot-distro install debian
proot-distro login debian
#
apt-get update && apt-get install -y wget libicu67
wget https://dot.net/v1/dotnet-install.sh
chmod 755 dotnet-install.sh
bash dotnet-install.sh --runtime aspnetcore --channel 6.0 --install-dir /usr/share/dotnet
ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet
#
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
#
cd /home
wget https://github.com/Jackett/Jackett/releases/latest/download/Jackett.Binaries.LinuxARM64.tar.gz
tar -xvf Jackett.Binaries.LinuxARM64.tar.gz
rm Jackett.Binaries.LinuxARM64.tar.gz
exit
#
curl https://raw.githubusercontent.com/bbk14/Termux-Debian-Lampac-Jackett/main/info.sh --output info.sh
chmod 755 info.sh
curl https://raw.githubusercontent.com/bbk14/Termux-Debian-Lampac-Jackett/main/kill.sh --output kill.sh
chmod 755 kill.sh
#
echo "bash kill.sh" >> ~/.bashrc
echo "tmux new-session -s Lampac -d "proot-distro login debian -- bash /root/lampac.sh"" >> ~/.bashrc
echo "tmux new-session -s Jackett -d "proot-distro login debian -- /home/Jackett/./jackett"" >> ~/.bashrc
echo "bash info.sh" >> ~/.bashrc
source ~/.bashrc
