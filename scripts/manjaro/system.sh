#!/bin/sh

stepcolor="\e[1;34m"
nocolor="\e[0m"

echo -e "${stepcolor} \n\n *** Baseline Update *** ${nocolor}"
sudo pacman -Syu --noconfirm

echo -e "${stepcolor} \n\n *** Install makepkg dependencies *** ${nocolor}"
sudo pacman -S --noconfirm --needed base-devel

echo -e "${stepcolor} \n\n *** Make Projects Folder *** ${nocolor}"
mkdir ~/Projects
