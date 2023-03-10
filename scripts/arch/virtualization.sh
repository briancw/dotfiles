# Don't require sudo for some stuff
sudo usermod -a -G libvirt $(whoami)
sudo usermod -a -G kvm $(whoami)
