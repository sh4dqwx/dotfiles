# My Arch Linux configuration
## WSL setup guide
### Install Arch Linux distro in WSL
```bash
wsl --install archlinux
```
### Install necessary packages
```bash
pacman -Syu
pacman -S base-devel git neovim openssh sudo
```
### Create and set default user
1. Set password to root user
```bash
passwd
```
2. Create user and set password
```bash
useradd -m -g users -G wheel sh4dqw
passwd sh4dqw
```
3. Add user to sudoers (uncomment **%wheel ALL=(ALL:ALL) ALL**)
```bash
EDITOR=nvim visudo
```
4. Set user to default (add this code to **/etc/wsl.conf**)
```bash
[user]
default=sh4dqw
```
### Set locale
1. Uncomment en_US.UTF-8
```bash
nvim /etc/locale.gen
```
2. Generate locale
```bash
locale-gen
```
### Set Git Credential Manager from Windows
```bash
git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager.exe"
```
### After refreshing session clone repo and run init script
```bash
git clone https://github.com/sh4dqwx/dotfiles.git ~/.dotfiles
source ~/.dotfiles/init.sh
```
