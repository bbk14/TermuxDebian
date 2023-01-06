#!/bin/bash

DEST="/home/lampac"

cd $DEST

ver=$(cat vers.txt)

gitver=$(curl -s https://api.github.com/repos/immisterio/Lampac/releases/latest | grep tag_name | sed s/[^0-9]//g)

if [[ "$gitver" -gt "$ver" ]]

  then

  echo -n $gitver > vers.txt

  wget https://github.com/immisterio/Lampac/releases/latest/download/publish.zip

  unzip -o publish.zip

  rm -f publish.zip

  bash /root/lampac.sh

fi
