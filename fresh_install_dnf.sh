#!/bin/bash


if [ "$(id -u)" -ne 0 ]; then
        echo 'This script must be run by root' >&2
        exit 1
fi

dnf check-updates

dnf upgrade --refresh

# Chezmoi isntallation and zsh installation
chezmoi init --apply jbettencourt10

dnf install zsh dnf-automatic

chsh -s $(which zsh)

cp -r fonts/* /usr/local/share/fonts

fc-cache -fv

systemctl enable --now dnf-automatic-install.timer


# TODO
# add templates for ubuntu
# isntall vscode, neofetch, bleachbit, discord, cheese, gimp, gnome-tweaks, htop, notepadqq, qbittorrent, synaptic, timeshift, vim, vlc, wireshark, ubuntu-resitricted-extras, gnome-logs, calibre, nordvpn, firefox, spotify, tor
