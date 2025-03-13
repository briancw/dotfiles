To run:
```shell
git clone git@github.com:briancw/dot-files.git ~/.dotfiles
cd .dotfiles
stow zsh
stow git
stow npm
chsh -s /usr/bin/zsh
```

Some Post system setup
```shell
sudo sed -i 's/#ParallelDownloads = [0-9]/ParallelDownloads = 10/' /etc/pacman.conf
sudo reflector --country 'United States' --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
```
