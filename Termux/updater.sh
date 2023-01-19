#!/bin/bash
notecheck=$(curl --head --silent https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/note.sh | head -n 1)
packagescheck=$(curl --head --silent https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/packages.sh | head -n 1)
note=$(if echo "$notecheck" | grep -q 200 ; then curl -s -J -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/note.sh ; fi)
packages=$(if echo "$packagescheck" | grep -q 200 ; then curl -s -J -O https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/packages.sh ; fi)
google=$(curl -I --head --silent https://raw.githubusercontent.com/bbk14/TermuxDebian/main/Termux/note.sh | head -n 1)

if echo "$google" | grep -q 200
then
echo "Update"
echo ""
$note
$packages
else
echo "No internet connection"
echo ""
fi
