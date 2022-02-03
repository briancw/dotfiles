#!/bin/sh

# Add Packman repository for non free software, particularly codecs
echo -e "\e[1;34m \n\n *** Add third party non-free repo *** \e[0m"
sudo zypper ar -cfp 90 https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/ packman
# Switch some installed software to the non free repo
sudo zypper --non-interactive --no-gpg-checks dup --from packman --allow-vendor-change

# Setup VSCode Install
echo -e "\e[1;34m \n\n *** Add VSCode sources *** \e[0m"
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo zypper addrepo https://packages.microsoft.com/yumrepos/vscode vscode

# Setup Brave Install
echo -e "\e[1;34m \n\n *** Add Brave sources *** \e[0m"
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo zypper addrepo https://brave-browser-rpm-release.s3.brave.com/x86_64/ brave-browser

# Add flathub repo
echo -e "\e[1;34m \n\n *** Add flathub flatpak repo *** \e[0m"
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install some required media codecs
echo -e "\e[1;34m \n\n *** Install media codecs *** \e[0m"
sudo zypper install -y \
ffmpeg \
gstreamer-plugins-bad \
gstreamer-plugins-libav \
gstreamer-plugins-ugly \
libavcodec-full \
vlc-codecs \
gstreamer-plugins-good \
gstreamer-plugins-good-extra

# Install apps
echo -e "\e[1;34m \n\n *** Install apps *** \e[0m"
sudo zypper install -y \
bat \
htop \
code \
vlc \
brave-browser \
dropbox \
python3-pip \
filelight \
powerline-fonts \
make \
gcc \
gcc-c++

# Remove default libre install
# sudo zypper remove -y libreoffice*

# Install Flatpak apps
echo -e "\e[1;34m \n\n *** Install flatpak apps *** \e[0m"
sudo flatpak install -y --noninteractive flathub \
com.spotify.Client org.freecadweb.FreeCAD \
com.discordapp.Discord \
com.obsproject.Studio \
io.github.shiftey.Desktop \
org.signal.Signal
# org.libreoffice.LibreOffice \

# Uninstall KDE's Discover
#echo -e "\e[1;34m \n\n *** Uninstall KDE Discover *** \e[0m"
#sudo zypper remove -y discover

# Install FNM
echo -e "\e[1;34m \n\n *** Install FNM *** \e[0m"
curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell
