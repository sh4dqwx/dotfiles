#!/usr/bin/bash

# Install all necessary packages from pacman
sudo pacman -S go zsh python gcc tmux ripgrep fd terraform --noconfirm

# Create directories for dev projects
mkdir -p ~/dev/tools ~/dev/private

# Setting up Yay
git clone https://aur.archlinux.org/yay.git ~/dev/tools/yay
cd ~/dev/tools/yay
makepkg -si
cd ~

# Install all necessary packages from yay
yay -S python312 --noconfirm

# Setting up Zsh and Oh My Zsh
chsh -s /usr/bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv ~/.oh-my-zsh ~/dev/tools/oh-my-zsh

cd ~/.dotfiles
stow .

cd ~
