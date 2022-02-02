#!/bin/sh

# Baseline Update
echo -e "\e[1;36m \n\n *** Baseline Update *** \e[0m"
sudo zypper ref
sudo zypper update -y

echo -e "\e[1;36m \n\n *** Basic system tasks *** \e[0m"
sh ./scripts/opensusetw/system.sh
echo -e "\e[1;36m \n\n *** Install Apps *** \e[0m"
sh ./scripts/opensusetw/apps.sh
echo -e "\e[1;36m \n\n *** Setup Terminal *** \e[0m"
sh ./scripts/opensusetw/terminal.sh
echo -e "\e[1;36m \n\n *** Configure Looks *** \e[0m"
sh ./scripts/opensusetw/looks.sh

# Echo 1password message
echo -e "\e[1;36m \n\n *** 1password cannot currently be installed non-interactively *** \e[0m \n\n"
echo -e "\e[1;36m *** Run 'sh ./scripts/opensusetw/1password.sh' *** \e[0m"
