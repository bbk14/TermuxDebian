#!/bin/bash
while true; do

if pgrep dotnet
then
killall dotnet
fi
cd /home/lampac
bash update.sh &

sleep 24h #24 години працює до перезапуску для перевірки оновлень

done
