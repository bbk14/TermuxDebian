#!/bin/bash
RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\033[1;36m'
YELLOW='\033[1;33m'
echo ""

echo -e "${RED}*****### Додатково ###*****"

echo -e "${GREEN}Lampac та Jackett працюють у фоні"
echo -e "${RED}Завантажена сесія Info !!!"

echo ""

echo -e "${BLUE}відключитись від підключеної сесії:"
echo -e " ${YELLOW}Ctrl+B+D"

echo -e "${BLUE}підключитись до сесії Lampac:"
echo -e " ${YELLOW}tmux attach -t Lampac"

echo ""

echo -e "${BLUE}підключитись до сесії Jackett:"
echo -e " ${YELLOW}tmux attach -t Jackett"
echo ""

echo -e "${BLUE}підключитись до сесії Jackett:"
echo -e " ${YELLOW}tmux attach -t Jackett"

echo ""

echo -e "${BLUE}підключитись до сесії info:"
echo -e " ${YELLOW}tmux attach -t Info"

echo ""

echo -e "${BLUE}зупинити всі сесії та програми:"
echo -e " ${YELLOW}tmux kill-server"

echo ""

echo -e "${BLUE}запустити Debian для додаткових налаштувань:"
echo -e " ${YELLOW}proot-distro login debian"

echo ""

echo -e "${BLUE}замінити APIKey Jackett:"
echo -e " ${YELLOW}nano /root/.config/Jackett/ServerConfig.json"
 
echo ""

echo -e "${BLUE}редагувати конфігурацію Lampac:"
echo -e " ${YELLOW}nano /home/lampac/init.conf"

echo ""

echo -e "${RED}про конфігурацію на сайті розробника:"
echo -e " ${GREEN}https://github.com/immisterio/Lampac"

echo ""
echo -e "${BLUE}СЛАВА ${YELLOW}УКРАЇНІ"
