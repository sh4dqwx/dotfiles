#!/usr/bin/bash

# Create directories for dev projects
mkdir -p $HOME/dev/tools $HOME/dev/private

# Install Yay
sudo pacman -S go --noconfirm
git clone https://aur.archlinux.org/yay.git ~/dev/tools/yay
cd $HOME/dev/tools/yay
makepkg -si
cd $HOME

# Install Oh My Z-Shell
yay -S oh-my-zsh-git

# Setting up Zsh as default shell
chsh -s /usr/bin/zsh

# Create/update symlinks for configuration
cd $HOME/.dotfiles
./update_symlinks.sh

cd $HOME
echo "Restart system NOW!!!"
