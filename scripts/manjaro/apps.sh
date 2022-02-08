#!/bin/sh

stepcolor="\e[1;34m"
nocolor="\e[0m"

echo -e "${stepcolor} \n\n *** Import keys *** ${nocolor}"
curl -sS https://downloads.1password.com/linux/keys/1password.asc | gpg --import
curl -sS https://mullvad.net/media/mullvad-code-signing.asc | gpg --import
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | gpg --import

echo -e "${stepcolor} \n\n *** Install Apps from pacman *** ${nocolor}"
sudo pacman -S --noconfirm --needed \
cups print-manager system-config-printer \
dog \
docker \
freecad \
qemu virt-manager vde2 bridge-utils openbsd-netcat edk2-ovmf swtpm \
vivaldi \
mpv \
peek \
skanlite \
tmux \
python-pip \
filelight \
signal-desktop \
obs-studio
# brave-browser \

echo -e "${stepcolor} \n\n *** Install Apps from AUR *** ${nocolor}"
pamac build --no-confirm \
skanpage \
visual-studio-code-bin \
github-desktop-bin \
1password \
mullvad-vpn-bin \
spotify \
fnm-bin

echo -e "${stepcolor} \n\n *** Install Node Stable *** ${nocolor}"
eval "`fnm env`"
fnm install --lts

echo -e "${stepcolor} \n\n *** Enable startup services for installed apps *** ${nocolor}"
# Virtualization
sudo usermod -a -G libvirt $USER
sudo systemctl enable --now libvirtd.service
sudo systemctl enable --now virtlogd.service
# Docker
sudo usermod -aG docker $USER
sudo systemctl enable docker.service
# Printer
sudo systemctl enable --now cups

# Virtualization network auto-start (might need work here yet)
# sudo virsh net-autostart --network default

# Add user to system group for printing. May not be necessary
# sudo gpasswd -a $USER sys
