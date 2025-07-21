#!/bin/bash

pacman -Syu --noconfirm
pacman -S git stow ghostty firefox code neovim less base-devel tree jdk21-openjdk maven podman podman-compose vlc vlc-plugins-all nvm dos2unix kdeconnect --needed --noconfirm
