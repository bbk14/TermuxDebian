#!/bin/bash
note=$(curl --head --silent https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/note.sh | head -n 1)
packages=$(curl --head --silent https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/packages.sh | head -n 1)

while true; do

if echo "$note" | grep -q 200
then
curl -s -J -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/note.sh
fi

if echo "$packages" | grep -q 200
then
curl -s -J -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/packages.sh
fi

sleep 5d #It runs for 5 days before restarting to check for updates or at every boot Termux

done
