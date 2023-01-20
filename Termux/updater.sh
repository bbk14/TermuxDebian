#!/bin/bash
note=$(curl --head --silent https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/note.sh | head -n 1)
packages=$(curl --head --silent https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/packages.sh | head -n 1)


if echo "$note" | grep -q 200
then
curl -s -J -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/note.sh
else
echo "Error update"
echo ""
fi

if echo "$packages" | grep -q 200
then
curl -s -J -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/packages.sh
else
echo "No internet connection"
echo ""
fi
