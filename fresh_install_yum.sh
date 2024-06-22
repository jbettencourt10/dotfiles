#!/bin/bash


if [ "$(id -u)" -ne 0 ]; then
        echo 'This script must be run by root' >&2
        exit 1
fi

yum check-update

yum update

yum install zsh

# Chezmoi isntallation and zsh installation
chezmoi init --apply jbettencourt10


chsh -s $(which zsh)

cp -r fonts/* /usr/local/share/fonts

fc-cache -fv

yum install firefox fastfetch htop wireshark vim vlc gimp


# TODO
# add templates for ubuntu
# isntall vscode, bleachbit, discord, cheese, gnome-tweaks, notepadqq, synaptic, timeshift, ubuntu-resitricted-extras, gnome-logs, nordvpn, spotify, tor
