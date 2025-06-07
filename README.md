# Quick Setup script
## Arch packages
### Pacman
There is a quick setup script located in `/scripts/` called `installPacmanPackages.sh`.
This sqript is for arch linux and will install my most commonly wanted packages, including the yay package manager.

### Yay
Before installing any yay packages, you need to install yay, make sure `git base-devel` packages are install. If you have run `installPacmanPackages.sh` they should be installed.

Install yay using following commands:
```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

#### yay packages install script
Run `installYayPackages.sh` to install packages from AUR.

# Dotfiles
The dotfiles are structured to be used with GNU Stow. Make sure `stow` is installed

### Known issues
If you get an error regarding locales not being configured, you can run the following as a temporary solution
```
export LC_ALL=C.UTF-8
export LC_ALL=C.UTF-8
```

## Install stow packages
Run the following command to install all dotfiles

### Bash, Alias, OMP
``` bash
stow 
```

### nvim
``` bash
stow nvmin
```

### ghostty
``` bash
stow ghostty
```

# Podman
Podman and podman-compose are installed when you run `installPacmanPackages.sh`, however, you need to specify a registry to be able to pull images.

Edit `/etc/containers/registries.conf` as sudo.

Change the following line:
```
#unqualified-search-registries = ["example.com"]
```
to
```
unqualified-search-registries = ["docker.io"]
```