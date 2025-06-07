## Quick Setup script
There is a quick setup script located in `/scripts/` called `quickSetup.sh`.
This sqript is for arch linux and will install my most commonly wanted packages, including the yay package manager.

Make sure to run `quickSetup.sh` as root.

## Dotfiles
The dotfiles are structured to be used with GNU Stow. Make sure `stow` is installed

#### Known issues
If you get an error regarding locales not being configured, you can run the following as a temporary sulution
```
export LC_ALL=C.UTF-8
export LC_ALL=C.UTF-8
```

### Install stow packages
Run the following command to install all dotfiles

#### Bash, Alias, OMP
``` bash
stow 
```

#### nvim
``` bash
stow nvmin
```

#### ghostty
``` bash
stow ghostty
```