#!/bin/sh

echo -e "\e[1;34m *** Baseline Update *** \e[0m \n\n"
sudo zypper ref
sudo zypper update -y

# Install Konsave for saving and loading KDE config
python -m pip install konsave