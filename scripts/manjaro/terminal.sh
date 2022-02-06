#!/bin/sh

echo -e "\e[1;34m \n\n *** Install GUN Stow *** \e[0m"
sudo pacman --noconfirm --needed -S stow zsh

# Move existing dotfiles
echo -e "\e[1;34m \n\n *** Backup existing dotfiles *** \e[0m"
mkdir ~/.default-dotfiles
mv ~/.bash* ~/.default-dotfiles
mv ~/.zshrc ~/.default-dotfiles

# Symlink dot files into home directory
echo -e "\e[1;34m \n\n *** Symlink dotfiles *** \e[0m"
stow zsh
stow git
stow npm
