#!/bin/bash
while true; do

if pgrep dotnet
then
killall dotnet
fi
cd /home/lampac
bash update.sh &

sleep 24h #It runs for 24 hours before restarting to check for updates

done
