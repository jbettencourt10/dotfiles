#!/bin/bash


# What makes sense here is this:
# Install OS
# Paste ssh key into ~/.ssh folder from USB drive
# Run the following two lines
        # sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply git@github.com:jbettencourt10/dotfiles.git
# Then run this script

# Check for root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo 'This script must be run as root' >&2
    exit 1
fi

# Detect Linux distribution
if [ -x "$(command -v lsb_release)" ]; then
    linux_distro=$(lsb_release -i | awk -F: '{print $2}' | xargs)
else
    echo 'lsb_release command not found. Defaulting to Fedora.' >&2
    linux_distro="Fedora"
fi

# Function to clean package cache
cleanup() {
    if [ "$linux_distro" == "Fedora" ]; then
        dnf autoremove -y
        dnf clean all
    elif [ "$linux_distro" == "Ubuntu" ]; then
        apt autoremove -y
        apt clean
    fi
}

# Install packages based on distribution
case "$linux_distro" in
    Fedora)
        echo "defaultyes=True" >> /etc/dnf/dnf.conf
        dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
        dnf check-update -y
        dnf upgrade -y
        dnf install -y firefox fastfetch htop wireshark vim vlc gimp zsh neovim tmux git-delta wl-clipboard bleachbit flatpak discord ripgrep fd fzf kitty gnome-tweaks
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
        flatpak install -y flathub com.spotify.Client
        cleanup
        ;;

    Ubuntu)
        add-apt-repository -y ppa:zhangsongcui3371/fastfetch
        apt update
        apt full-upgrade -y
        apt install -y firefox fastfetch htop wireshark vim vlc gimp zsh gnome-tweaks gnome-logs cheese notepadqq ubuntu-restricted-extras git curl wget gpg neovim tmux git-delta synaptic

        # VSCode installation
        wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
        install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/packages.microsoft.gpg
        echo "deb [arch=amd64,arm64,armhf] https://packages.microsoft.com/repos/code stable main" | tee /etc/apt/sources.list.d/vscode.list > /dev/null
        apt update
        apt install -y code
        rm -f packages.microsoft.gpg

        cleanup
        ;;
    
    *)
        echo "Unsupported Linux distribution: $linux_distro" >&2
        exit 1
        ;;
esac




# Change default shell to zsh
chsh -s "$(which zsh)"

# Install fonts
mkdir -p ~/.local/share/fonts
cp -r ~/fonts/* ~/.local/share/fonts/
fc-cache -fv

echo "You should now reboot the system!"

# Manual Tasks
echo "Manual tasks to complete:"
echo "- Install Bitwarden extension"
echo "- Install Nvidia drivers if on Fedora, but only after rebooting. When drivers are installed, wait for them to build and then reboot again"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# TODO
# echo "TODO:"
# echo "- Add templates for Ubuntu"
# echo "- Install Timeshift, Tor"
# add bat, eza, httpie
# import gpg key
# import ssh key
# make ssh key auto unlock eval agent
# tmux plugin manager
