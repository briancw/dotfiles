#!/bin/sh

stepcolor="\e[1;34m"
nocolor="\e[0m"

echo -e "${stepcolor} \n\n *** Configure Pacman and Baseline Update *** ${nocolor}"
# Uncomment Parallel Downloads and set to 8
# sed -i '/ParallelDownloads/s/^#//g' /etc/pacman.conf
sed -i 's/#ParallelDownloads = [0-9]/ParallelDownloads = 10/' /etc/pacman.conf
sudo pacman-mirrors --fasttrack
sudo pacman -Syu --noconfirm

echo -e "${stepcolor} \n\n *** Install makepkg dependencies *** ${nocolor}"
sudo pacman -S --noconfirm --needed base-devel

echo -e "${stepcolor} \n\n *** Make Projects Folder *** ${nocolor}"
mkdir ~/Projects
