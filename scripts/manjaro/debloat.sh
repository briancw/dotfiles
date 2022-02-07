#!/bin/sh

stepcolor="\e[1;34m"
nocolor="\e[0m"

# Uninstall some automatically inlcluded programs
echo -e "${stepcolor} \n\n *** Uninstall apps *** ${nocolor}"
sudo pacman --noconfirm -Rncs \
kate \
firefox \
oxygen oxygen-icons
