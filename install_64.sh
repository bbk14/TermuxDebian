#!/bin/bash
BLUE='\033[1;36m'
YELLOW='\033[1;33m'
LAMPAC="/home/lampac"

pkg install -y wget tmux proot-distro

curl -s https://raw.githubusercontent.com/bbk14/Termux-Debian-Lampac-Jackett/main/information.sh -O information.sh
chmod 755 information.sh

echo "tmux new-session -s Lampac -d "proot-distro login debian -- bash /root/cron.sh"" >> ~/.bashrc
echo "tmux new-session -s Jackett -d "proot-distro login debian -- /home/Jackett/./jackett"" >> ~/.bashrc
echo "bash information.sh"" >> ~/.bashrc
echo "tmux detach" >> ~/.bashrc
source ~/.bashrc

proot-distro install debian
proot-distro login debian

apt-get update && apt-get install -y wget libicu67

wget https://dot.net/v1/dotnet-install.sh
chmod 755 dotnet-install.sh
bash dotnet-install.sh --runtime aspnetcore --channel 6.0 --install-dir /usr/share/dotnet
ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet

wget https://raw.githubusercontent.com/bbk14/Termux-Debian-Lampac-Jackett/main/information.sh
chmod 755 information.sh

wget https://raw.githubusercontent.com/bbk14/Termux-Debian-Lampac-Jackett/main/cron.sh
chmod 755 cron.sh

mkdir $DEST -p && cd $DEST
wget https://github.com/immisterio/Lampac/releases/download/lam33/publish.zip
unzip -o publish.zip
rm -f publish.zip
wget https://raw.githubusercontent.com/bbk14/Termux-Debian-Lampac-Jackett/main/update.sh
chmod 755 update.sh
cp example.conf init.conf
echo '33' > vers.txt

cd /home
wget https://github.com/Jackett/Jackett/releases/latest/download/Jackett.Binaries.LinuxARM64.tar.gz
tar -xvf Jackett.Binaries.LinuxARM64.tar.gz
rm Jackett.Binaries.LinuxARM64.tar.gz

exit
echo "Готово !!!"
echo -e "${BLUE}СЛАВА ${YELLOW}УКРАЇНІ"
cd $HOME/bash information.sh
exit
