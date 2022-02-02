#!/bin/bash
sudo zyyper ref
sudo zypper update -y

# Extra non free software repo
sudo zypper ar -cfp 90 https://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Tumbleweed/ packman
sudo zypper dup -y --from packman --allow-vendor-change

# Switch some installed software to the non free repo
sudo zypper --non-interactive --no-gpg-checks dup --from packman --allow-vendor-change

# Setup VSCode Install
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo zypper addrepo https://packages.microsoft.com/yumrepos/vscode vscode

# Setup Brave Install
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo zypper addrepo https://brave-browser-rpm-release.s3.brave.com/x86_64/ brave-browser

# Add flathub repo
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install some required media codecs
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
sudo zypper install -y \
bat \
htop \
util-linux-user \
code \
vlc \
brave-browser \
dropbox \
python3-pip \
powerline-fonts

# Remove default libre install
# sudo zypper remove -y libreoffice*

# Install Flatpak apps
flatpak install -y --noninteractive flathub \
com.spotify.Client org.freecadweb.FreeCAD \
com.discordapp.Discord \
com.obsproject.Studio \
io.github.shiftey.Desktop \
org.signal.Signal
# org.libreoffice.LibreOffice \

# Install 1password from an RPM
# Requires user interaction
sudo zypper install https://downloads.1password.com/linux/rpm/stable/x86_64/1password-latest.rpm
