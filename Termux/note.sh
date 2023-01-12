#!/bin/bash
RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'
echo -e "${RED}*****### NOTE ###*****"
echo -e " ${BLUE}***With love ${YELLOW}from Ukraine***"
echo ""
echo "${NC}***"
bash noteT.sh
echo ""
echo "${NC}***"
bash noteD.sh
echo ""
echo "${NC}***"
echo -e "${GREEN}Do you wish to load packages control ?"
while true; do
    read -p "Say (y or n) : " yn
    case $yn in
        [Yy]* ) bash packages_control.sh; break;;
        [Nn]* ) exit;;
        * ) echo -e "${RED}Please answer y or n${GREEN}";;
    esac
done
