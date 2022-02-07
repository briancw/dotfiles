#!/bin/sh

stepcolor="\e[1;34m"
nocolor="\e[0m"

# Install Konsave for saving and loading KDE config
echo -e "${stepcolor} \n\n *** Install konsave *** ${nocolor}"
python3 -m pip install konsave

pacman -S latte-dock --noconfirm