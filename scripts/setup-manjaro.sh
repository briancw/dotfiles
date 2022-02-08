#!/bin/sh

titlecolor="\e[0;31m"
stepcolor="\e[1;34m"
nocolor="\e[0m"

echo -e "${titlecolor} \n\n *** Setup System *** ${nocolor}"
sh ./scripts/manjaro/system.sh

echo -e "${titlecolor} \n\n *** Setup Terminal *** ${nocolor}"
sh ./scripts/manjaro/terminal.sh

echo -e "${titlecolor} \n\n *** Install Apps *** ${nocolor}"
sh ./scripts/manjaro/apps.sh

echo -e "${titlecolor} \n\n *** Uninstall some default Apps *** ${nocolor}"
sh ./scripts/manjaro/debloat.sh

echo -e "${titlecolor} \n\n *** Setup looks *** ${nocolor}"
sh ./scripts/manjaro/looks.sh

echo -e "${titlecolor} \n\n *** Run zsh init last *** ${nocolor}"
sh ./scripts/manjaro/zsh-init.sh
