#!/bin/bash
sudo zypper update -y

# Install ZSH
echo -e "\e[1;34m Install ZSH \e[0m"
sudo zypper install -y zsh

# Symlink dot files into home directory
# Consider replacing this with gnu-stow
echo -e "\e[1;34m Symlink dotfiles \e[0m"
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/zsh/.zshenv ~/.zshenv
ln -s ~/.dotfiles/zsh/.aliases ~/.aliases
ln -s ~/.dotfiles/zsh/.zsh_plugins.txt ~/.zsh_plugins.txt
ln -s ~/.dotfiles/zsh/.p10k.zsh ~/.p10k.zsh
ln -s ~/.dotfiles/npm/.npmrc ~/.npmrc
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/git/.gitignore_global ~/.gitignore_global

# Install FNM
echo -e "\e[1;34m Install FNM \e[0m"
curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell

# Install AntiBody
echo -e "\e[1;34m Install AntiBody \e[0m"
curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin

# Bundle ZSH plugins with antibody
echo -e "\e[1;34m Bundle ZSH Plugins \e[0m"
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# Change default shell to Zsh
echo -e "\e[1;34m Change default shell to ZSH \e[0m"
sudo chsh -s $(which zsh) $USER

# Create Projects Dir
mkdir ~/Projects

# Remove user bin folder
echo -e "\e[1;34m Remove OpenSuse default user bin folder \e[0m"
rm -rf ~/bin
