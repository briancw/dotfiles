#!/bin/sh

# Uninstall some automatically inlcluded programs
echo -e "\e[1;34m \n\n *** Uninstall apps *** \e[0m"
sudo pacman --noconfirm -Rncs \
kate \
firefox
