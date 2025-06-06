#!/bin/bash

pacman -Syu --noconfirm
pacman -S git stow ghostty firefox code neovim less base-devel tree --needed --noconfirm

# Install yay
currentDir=$(pwd)

if ! yay --version &>/dev/null; then
    if test -d ~/Downloads; then
        downloads = ~/Downloads
    elif test -d ~/Hämtningar; then
        downloads = ~/Hämtningar
    else 
        echo "Failed to determine a downloads folder. Creating one"
        mkdir -p ~/Downloads
        downloads = ~Downloads
    fi

    cd "$downloads"
    git clone https://aur.archlinux.org/yay.git
    cd yay || exit 1
    makepkg -si
    if yay --version &>/dev/null; then
        echo Successfully installed yay
    else
        echo "Failed to install yay"
    fi
else
    echo "yay is already present in system. Skipping"
fi
cd "$currentDir"


# Stow dotfiles

export LC_ALL=C.UTF-8
export LC_CTYPE=C.UTF-8
stow -d ../stow/ -t ~/ nvim ghostty
# stow -t ~/ -d stow/ nvim
