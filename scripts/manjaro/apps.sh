#!/bin/sh

# Import GPG keys
echo -e "\e[1;34m \n\n *** Import keys *** \e[0m"
curl -sS https://downloads.1password.com/linux/keys/1password.asc | gpg --import
curl -sS https://mullvad.net/media/mullvad-code-signing.asc | gpg --import

# Install Apps
echo -e "\e[1;34m \n\n *** Install Apps from pacman *** \e[0m"
sudo pacman -S --noconfirm --needed \
brave-browser \
vivaldi \
code \
mpv \
freecad \
qemu virt-manager vde2 bridge-utils openbsd-netcat edk2-ovmf swtpm \
peek \
cups print-manager system-config-printer \
skanlite \
tmux \
dog

# Install apps from AUR
echo -e "\e[1;34m \n\n *** Install Apps from AUR *** \e[0m"
pamac build skanpage --no-confirm
pamac build github-desktop-bin --no-confirm
pamac build 1password --no-confirm
pamac build mullvad-vpn-bin --no-confirm

# Install FNM
echo -e "\e[1;34m \n\n *** Install FNM *** \e[0m"
sudo pacman -S --noconfirm --needed unzip
curl -fsSL https://fnm.vercel.app/install | sh -s -- --skip-shell

// TODO Need to activate FNM before it can be used
# Install current LTS Node
#echo -e "\e[1;34m \n\n *** Install Node Stable *** \e[0m"
#fnm install --lts

# Enable virtualization service
sudo usermod -a -G libvirt $USER
sudo systemctl enable --now libvirtd.service
sudo systemctl enable --now virtlogd.service
# Possibly needed to autostart network, but may not work here
# sudo virsh net-autostart --network default

# Enable printer services
sudo systemctl enable --now cups
# sudo gpasswd -a $USER sys