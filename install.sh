#!/bin/bash
VER="$(uname -m | grep aarch64)"
pkg install -y wget tmux proot-distro
if [[ "$VER" == "aarch64" ]];
then
curl -s https://raw.githubusercontent.com/bbk14/Termux-Debian-Lampac-Jackett/main/ver64.sh | bash
else
curl -s https://raw.githubusercontent.com/bbk14/Termux-Debian-Lampac-Jackett/main/ver32.sh | bash
fi
