#!/bin/sh

stepcolor="\e[1;34m"
nocolor="\e[0m"

echo -e "${stepcolor} \n\n *** Configure Pacman and Baseline Update *** ${nocolor}"
# Uncomment Parallel Downloads and set to 8
# sed -i '/ParallelDownloads/s/^#//g' /etc/pacman.conf
sudo sed -i 's/#ParallelDownloads = [0-9]/ParallelDownloads = 10/' /etc/pacman.conf
sudo pacman -Syu --noconfirm

sudo reflector --country 'United States' --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

echo -e "${stepcolor} \n\n *** Install makepkg dependencies *** ${nocolor}"
sudo pacman -S --noconfirm --needed base-devel

echo -e "${stepcolor} \n\n *** Make Projects Folder *** ${nocolor}"
mkdir ~/Projects

echo -e "${stepcolor} \n\n *** Enable mounting ntfs disks from Dolphin *** ${nocolor}"
echo -e "[defaults]\nntfs_defaults=uid=$UID,gid=$GID\nntfs_allow=uid=$UID,gid=$GID,umask,dmask,fmask,locale,norecover,ignore_case,compression,nocompression,big_writes,nls,nohidden,sys_immutable,sparse,showmeta,prealloc" | sudo tee -a /etc/udisks2/mount_options.conf
