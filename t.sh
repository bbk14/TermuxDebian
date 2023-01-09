#!/bin/bash
 
proot-distro login debian
cd /home
mkdir torrserver
cd /home/torrserver
wget https://github.com/YouROK/TorrServer/releases/download/MatriX.118/TorrServer-android-arm64
mv TorrServer-android-arm64 torrserver
chmod 755 torrserver
chmod 755 config.db
exit
