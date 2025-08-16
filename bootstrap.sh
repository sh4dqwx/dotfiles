#!/usr/bin/bash

# Create directories for dev projects
mkdir -p $HOME/dev/tools $HOME/dev/private

# Install Yay
sudo pacman -S go --noconfirm
git clone https://aur.archlinux.org/yay.git ~/dev/tools/yay
cd $HOME/dev/tools/yay
makepkg -si
cd $HOME

# Install all necessary packages from pacman
yay -S go zsh oh-my-zsh-git python gcc tmux ripgrep fd terraform --noconfirm

# Setting up Zsh as default shell
chsh -s /usr/bin/zsh

cd $HOME/.dotfiles
stow --adopt .

cd $HOME
