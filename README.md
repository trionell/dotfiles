# Quick Setup script
# Arch packages
## Pacman
There is a quick setup script located in `/scripts/` called `installPacmanPackages.sh`.
This sqript is for arch linux and will install my most commonly wanted packages, including the yay package manager.

## Yay
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

## Hibernation
In order to enable hibernation, you need to have a suitable swap configured. If no swap options are available in KDE (or you get a swap related error when running `systemctl hibernate`) then do the following:

Easiest is to create a swap file but a swap partition should work as well.

### Hibernation/Swap file
In order to enable hibernation there needs to be enough swap configured to fit the entire RAM. For a system with 32GB of ram I will create a 34GB swap file.

1. **Allocate/create the file**
    ```
    sudo fallocate -l 34G /swapfile
    ```
2. **Write all zeros to the swap file**<br>
    _Explanations_
    * bs = block size. The example is set to 1 Megabyte
    * count = 1024 (MB) * 34 (GB) = 34816
    ```
    sudo dd if=/dev/zero of=/swapfile bs=1M count=34816
    ```
3. **Set permission on swapfile**<br>
    600 = read & write permission for owner group only
    ```
    sudo chmod 600 /swapfile
    ```
4. **Make swap**<br>
    ```
    sudo mkswap /swapfile
    ```
5. **Enable swap on swapfile**<br>
    ```
    sudo swapon /swapfile
    ```
6. **Validate entry of swapfile**<br>
    ```
    swapon -s
    ```
    Output should contain:
    ```
    Filename                                Type            Size            Used            Priority
    /swapfile                               file            35651580        0               -2
    ```
7. **Check if hibernate works**<br>
    Unless you are using BIOS instead of UEFI it should be working now. To check if hibernate is working, run `systemctl hibernate`.
8. **Make swapfile available on boot**<br>
    The swapfile will not be enabled after a reboot. You need to add an entry to `/etc/fstab` in order for it to be auto registered.<br>
    Add the following to the bottom of the file:
    ```
    # Swapfile
    /swapfile   none    swap    defaults 0   0
    ```
    The swapfile should now be immediately available after boot. You can verify by rebooting and running the same command as in Step #6

## Bluetooth
Bluetooth kernel module is not installed by default. If you use Arch with KDE, then the following steps should be enough (taken from guide: https://wiki.archlinux.org/title/Bluetooth)
1.  Install bluez packages (see guide above for details if interrested)
    ```
    sudo pacman -S bluez bluez-utils bluez-deprecated-tools
    ```
2.  Make sure bluetooth kernel module is loaded by running `lsmod`. The following line should be present in the output (numbers may be different)
    ```
    bluetooth            1097728  34 btrtl,btmtk,btintel,btbcm,btusb
    ```
    The important part (according to the arch wiki guide) is the presence of `btusb`
3.  Start bluetooth service by running
    ```
    sudo systemctl start bluetooth.service
    ```
4.  Enable (start on boot/login) bluetooth service by running
    ```
    sudo systemctl enable bluetooth.service
    ```
Bluetooth should now work in KDE settings and the bluetooth icon in the system tray should be present/available.