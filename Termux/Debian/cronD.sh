#!/bin/bash
while true; do
#scriptStart

curl -s -J -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/Debian/install.sh
curl -s -J -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/Debian/uninstall.sh

#scriptEnd

sleep 5d #It runs for 5 days before restarting to check for updates

done
