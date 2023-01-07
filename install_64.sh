#!/bin/bash
BLUE='\033[1;36m'
YELLOW='\033[1;33m'
LAMPAC="/home/lampac"

#Termux встановлення пакетів
pkg install -y wget tmux proot-distro
#Завантаження info
wget https://github.com/bbk14/Termux-Debian-Lampac-Jackett/blob/main/information.sh -O information.sh
chmod 755 information.sh
#Встановлення автозавантаження в Termux: Lampac Jackett info
echo "tmux new-session -s Lampac -d "proot-distro login debian -- bash /root/cron.sh"" >> ~/.bashrc
echo "tmux new-session -s Jackett -d "proot-distro login debian -- /home/Jackett/./jackett"" >> ~/.bashrc
echo "tmux detach" >> ~/.bashrc
echo "./information.sh" >> ~/.bashrc
source ~/.bashrc
#Встановлення та завантаження debian
proot-distro install debian
proot-distro login debian
#Оновлення та встановлення пакетів debian
apt-get update && apt-get install -y wget libicu67
#Встановлення ASP.NET 6
wget https://dot.net/v1/dotnet-install.sh
chmod 755 dotnet-install.sh
./dotnet-install.sh --runtime aspnetcore --channel 6.0 --install-dir /usr/share/dotnet
ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet
#Завантаження автозавантаження Lampac та перевірка оновлення кожні 24 години
wget https://github.com/bbk14/Termux-Debian-Lampac-Jackett/blob/main/cron.sh -O cron.sh
chmod 755 cron.sh
#Встановлення Lampac
mkdir $DEST -p && cd $DEST
wget https://github.com/immisterio/Lampac/releases/download/lam33/publish.zip
unzip -o publish.zip
rm -f publish.zip
wget https://github.com/bbk14/Termux-Debian-Lampac-Jackett/blob/main/update.sh -O update.sh
chmod 755 update.sh
cp example.conf init.conf
echo '33' > vers.txt
#Встановлення Jackett
cd /home
wget https://github.com/Jackett/Jackett/releases/latest/download/Jackett.Binaries.LinuxARM64.tar.gz
tar -xvf Jackett.Binaries.LinuxARM64.tar.gz
rm Jackett.Binaries.LinuxARM64.tar.gz

exit
echo "Готово !!!"
echo "${BLUE}СЛАВА ${YELLOW}УКРАЇНІ"
exit
