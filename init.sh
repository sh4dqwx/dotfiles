#!/usr/bin/bash

# Setting up Zsh
sudo pacman -S zsh
chsh -p /usr/bin/zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mkdir -p ~/dev/tools
mv ~/.oh-my-zsh ~/dev/tools/oh-my-zsh

# Setting up Neovim
sudo pacman -S neovim python gcc

stow .
