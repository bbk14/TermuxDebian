#!/bin/bash

while true; do

  killall dotnet

  bash /root/start.sh &

  sleep 86400 #24 години у секундах

done
