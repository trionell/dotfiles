#!/bin/bash

pacman -Syu --noconfirm
pacman -S git stow ghostty firefox code neovim less base-devel tree jdk21-openjdk maven podman podman-compose vlc nvm dos2unix --needed --noconfirm
