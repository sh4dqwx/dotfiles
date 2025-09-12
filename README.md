# My Arch Linux configuration
## WSL Setup Guide
### Install Arch Linux distro in WSL
```bash
wsl --install archlinux
```
### Run init script
```bash
curl -fsSL https://raw.githubusercontent.com/sh4dqwx/dotfiles/main/init_wsl.sh | bash -s -- \
--root_password [root_password] \
--username [username] \
--password [password]
```
### After refreshing session and entering Linux as created user, run bootstrap script for configuring user's environment
```bash
~/.dotfiles/bootstrap.sh
```
