#!/bin/bash

linux_distro=$(lsb_release -a)

if [ "$(id -u)" -ne 0 ]; then
        echo 'This script must be run by root' >&2
        exit 1
fi


if [[ $linux_distro == *"Fedora"* ]]; then
        yum check-update
        yum update
        yum install firefox fastfetch htop wireshark vim vlc gimp zsh
        # TODO: it would be a good idea to add a few cleanup tasks here
        yum autoremove
        yum clean all
elif [[ $linux_distro == *"Ubuntu"* ]]; then
        apt update
        apt full-upgrade 
        apt install firefox fastfetch htop wireshark vim vlc gimp zsh gnome-tweaks gnome-logs cheese notepadqq ubuntu-resitricted-extras
        apt autoremove
        apt clean

fi


ssh-keygen
# UPLOAD THIS TO GIT

# Chezmoi isntallation and zsh installation
GITHUB_USERNAME=jbettencourt10

sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply git@github.com:$GITHUB_USERNAME/dotfiles.git



chsh -s $(which zsh)


mkdir -p ~/.local/share/fonts/ && cp ~/fonts/* ~/.local/share/fonts && fc-cache -fv


echo "You should now login and then out!"

# TODO
# add templates for ubuntu
# isntall vscode, bleachbit, discord, synaptic, timeshift, nordvpn, spotify, tor
