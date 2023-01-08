#!/bin/bash
BLUE='\033[1;36m'
YELLOW='\033[1;33m'
VER="$(uname -m | grep aarch64)"
if [[ "$VER" == "aarch64" ]];
then
curl -s https://raw.githubusercontent.com/bbk14/Termux-Debian-Lampac-Jackett/main/ver64.sh | bash
else
curl -s https://raw.githubusercontent.com/bbk14/Termux-Debian-Lampac-Jackett/main/ver32.sh | bash
fi
