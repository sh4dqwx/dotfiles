#!/usr/bin/bash

# Make dev directory
mkdir -p ~/dev/tools
mkdir ~/dev/private

# Setting up Yay
sudo pacman -S go
git clone https://aur.archlinux.org/yay.git ~/dev/tools/yay
cd ~/dev/tools/yay
makepkg -si

# Setting up Zsh
sudo pacman -S zsh --noconfirm
chsh -s /usr/bin/zsh
# Setting up Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv ~/.oh-my-zsh ~/dev/tools/oh-my-zsh

# Setting up Neovim
sudo pacman -S python gcc tmux ripgrep fd --noconfirm
yay -S python312

# Other (add somewhere later)
sudo pacman -S terraform --noconfirm

cd ~/.dotfiles
stow .

cd ~
