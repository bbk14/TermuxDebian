#!/bin/bash
while true; do
#scriptStart

curl -s -J -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/note.sh
curl -s -J -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/packages_control.sh

#scriptEnd

sleep 5d #It runs for 5 days before restarting to check for updates

done
