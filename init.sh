#!/usr/bin/bash

# Setting up Yay
sudo pacman -S git base-devel
git clone https://aur.archlinux.org/yay.git ~/dev/tools/yay
cd ~/dev/tools/yay
makepkg -si

# Setting up Zsh
sudo pacman -S zsh
chsh -s /usr/bin/zsh
# Setting up Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mkdir -p ~/dev/tools
mv ~/.oh-my-zsh ~/dev/tools/oh-my-zsh

# Setting up Neovim
sudo pacman -S neovim python gcc tmux ripgrep fd
yay -S python312

cd ~/.dotfiles
stow .

cd ~
