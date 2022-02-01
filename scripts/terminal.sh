sudo dnf install -y zsh

# Symlink dot files into home directory
# Consider replacing this with gnu-stow
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/zsh/.zshenv ~/.zshenv
ln -s ~/.dotfiles/zsh/.aliases ~/.aliases
ln -s ~/.dotfiles/zsh/.zsh_plugins.txt ~/.zsh_plugins.txt
ln -s ~/.dotfiles/zsh/.p10k.zsh ~/.p10k.zsh
ln -s ~/.dotfiles/npm/.npmrc ~/.npmrc
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/git/.gitignore_global ~/.gitignore_global

# Install FNM
curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell

# Install AntiBody
curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin

# Bundle ZSH plugins with antibody
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# Change default shell to Zsh
sudo chsh -s $(which zsh) $USER

# Create Projects Dir
mkdir ~/Projects
