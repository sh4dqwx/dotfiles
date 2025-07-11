# My Arch Linux configuration

## WSL setup guide
1. Install Arch Linux distro in WSL
```bash
wsl --install archlinux
```
2. Create and set default user
    1. Set password to root user
```bash
passwd
```
    2. Create user
```bash
useradd -m -g users -G wheel sh4dqw
```
