#!/bin/bash
note=$(curl --head --silent https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/note.sh | head -n 1)
packages=$(curl --head --silent https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/packages.sh | head -n 1)

if echo "$note" | grep -q 200
then
curl -s -J -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/note.sh
fi

if echo "$packages" | grep -q 200
then
curl -s -J -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/packages.sh
fi
