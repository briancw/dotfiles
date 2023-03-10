#!/bin/sh

stepcolor="\e[1;34m"
nocolor="\e[0m"

echo -e "${stepcolor} \n\n *** Install GUN Stow *** ${nocolor}"
sudo pacman --noconfirm --needed -S stow zsh

# Move existing dotfiles
echo -e "${stepcolor} \n\n *** Backup existing dotfiles *** ${nocolor}"
mkdir ~/.default-dotfiles
mv ~/.bash* ~/.default-dotfiles
mv ~/.zshrc ~/.default-dotfiles

# Symlink dot files into home directory
echo -e "${stepcolor} \n\n *** Symlink dotfiles *** ${nocolor}"
stow zsh
stow git
stow npm

chsh -s /usr/bin/zsh
