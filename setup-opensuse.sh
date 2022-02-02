#!/bin/sh
sh ./scripts/opensusetw/apps.sh
sh ./scripts/opensusetw/terminal.sh
sh ./scripts/opensusetw/looks.sh

# Echo 1password message
echo -e "\e[1;34m *** 1password cannot currently be installed non-interactively *** \e[0m \n\n"
echo -e "\e[1;34m *** Run 'sh ./scripts/opensusetw/1password.sh' *** \e[0m \n\n"
