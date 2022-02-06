#!/bin/sh

# Create Projects Dir
echo -e "\e[1;34m \n\n *** Make Projects Folder *** \e[0m"
mkdir ~/Projects

# Setup makepkg
echo -e "\e[1;34m \n\n *** Install makepkg dependencies *** \e[0m"
sudo pacman -S --noconfirm --needed base-devel
