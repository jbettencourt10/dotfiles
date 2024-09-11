#!/bin/bash


# What makes sense here is this:
# Install OS
# Paste ssh key into ~/.ssh folder from USB drive
# Run the following two lines
        # GITHUB_USERNAME=jbettencourt10
        # sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply git@github.com:$GITHUB_USERNAME/dotfiles.git
# Then run this script

# FIXME: this command does not exist on fedora for some reason
linux_distro=$(lsb_release -a)

if [ "$(id -u)" -ne 0 ]; then
        echo 'This script must be run by root' >&2
        exit 1
fi

# TODO: Set y to be dfault action by adding to /etc/dnf/dnf.conf

if [[ $linux_distro == *"Fedora"* ]]; then
        dnf check-update
        dnf update
        dnf install firefox fastfetch htop wireshark vim vlc gimp zsh neovim tmux
        # TODO: it would be a good idea to add a few cleanup tasks here
        dnf autoremove
        dnf clean all
elif [[ $linux_distro == *"Ubuntu"* ]]; then
        add-apt-repository ppa:zhangsongcui3371/fastfetch
        apt update
        apt full-upgrade 
        apt install firefox fastfetch htop wireshark vim vlc gimp zsh gnome-tweaks gnome-logs cheese notepadqq ubuntu-restricted-extras git curl wget gpg neovim tmux
        # Below is for VSCode
        wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
        sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
        echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
        rm -f packages.microsoft.gpg
        apt install apt-transport-https
        apt update
        apt install code
        apt autoremove
        apt clean
fi

# TODO: Add node
chsh -s $(which zsh)

mkdir -p ~/.local/share/fonts/ && cp ~/fonts/* ~/.local/share/fonts && fc-cache -fv

echo "You should now reboot the system!"

# Manual Tasks:
# Install Bitwarden extension


# TODO
# add templates for ubuntu
# isntall bleachbit, discord, synaptic, timeshift, spotify, tor
# wl-clipboard for wayland neovim
