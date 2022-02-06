#!/bin/sh

echo -e "\e[1;36m \n\n *** Baseline Update *** \e[0m"
sudo pacman -Syu --noconfirm

echo -e "\e[1;36m \n\n *** Setup System *** \e[0m"
sh ./scripts/manjaro/system.sh

echo -e "\e[1;36m \n\n *** Setup Terminal *** \e[0m"
sh ./scripts/manjaro/terminal.sh

echo -e "\e[1;36m \n\n *** Install Apps *** \e[0m"
sh ./scripts/manjaro/apps.sh

echo -e "\e[1;36m \n\n *** Uninstall some default Apps *** \e[0m"
sh ./scripts/manjaro/debloat.sh
