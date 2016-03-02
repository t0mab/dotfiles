loadkeys fr

gdisk /dev/sda
```
o
Y
n
<ENTER>
<ENTER>
+128M
ef00
n
<ENTER>
<ENTER>
+0
<ENTER>
w
Y
```

mkfs.vfat -n BOOT -F 32 /dev/sda1
cryptsetup -v --cipher aes-xts-plain64 --key-size 256 -y luksFormat /dev/sda2
cryptsetup luksOpen /dev/sda2 archlinux
mkfs.btrfs -L ROOT /dev/mapper/archlinux
pacman -S btrfs-progs
OR
mkfs.ext4 -L ROOT /dev/mapper/archlinux

mount /dev/mapper/archlinux /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

pacstrap /mnt
genfstab -p /mnt >> /mnt/etc/fstab
arch-chroot /mnt
pacman -S neovim
echo kyufix > /etc/hostname
ln -sf /usr/share/zoneinfo/UTC /etc/localtime
echo "en_US.UTF-8 UTF-8 > /etc/locale.gen"
locale-gen
passwd

/etc/mkinitcpio.conf :
HOOKS="base udev autodetect modconf block keymap keyboard encrypt filesystems fsck"

vconsole.conf :
KEYMAP=fr

mkinitcpio -p linux

###### UEFI :
bootctl install
/boot/loader/loader.conf:
```
default ArchLinux
timeout 2
```

mkdir -p /boot/loader/entries


/boot/loader/entries/archlinux.conf :
```
title ArchLinux
linux vmlinuz-linux
initrd initramfs-linux.img
options cryptdevice=/dev/sda2:archlinux:allow-discards root=/dev/mapper/archlinux rw
```

### Network
systemctl enable systemd-networkd
systemctl enable systemd-resolved
rm /etc/resolv.conf
ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf

/etc/systemd/network/wired.network :
```
[Match]
Name=en*

[Network]
DHCP=yes
```

### Reboot !
<ctrl>+d
reboot

#### SSH

pacman -S openssh ufw
systemctl enable sshd.service
ufw allow 22
ufw enable
systemctl enable ufw
ufw logging off

### Settings

hostname set-hostname namazu
localectl set-locale LANG=en_US.utf8
localectl set-keymap fr
localectl set-x11-keymap fr
timedatectl set-ntp true

### Docker

pacman -S docker
systemctl enable docker.socket
systemctl start docker.socket

### nvidia

pacman -S nvidia nvidia-libgl libvdpau

### intel

/etc/mkinitcpio.conf :
MODULES="i915"

mkinitcpio -p linux

pacman -S mesa-libgl xf86-video-intel libvdpau-va-gl libva-intel-driver

### User

pacman -S sudo zsh
useradd -m -s /usr/bin/zsh -G wheel,uucp,rfkill,games,lock,network,storage,users,docker fabien
passwd fabien

visudo
uncomment : %wheel ALL=(ALL) ALL

### Install them all !!!

### Yaourt

pacman -S base-devel
curl -O https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz
tar zxvf package-query.tar.gz
cd package-query
makepkg -si
cd ..
curl -O https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz
tar zxvf yaourt.tar.gz
cd yaourt
makepkg -si
cd ..

pacman -S git
git clone https://github.com/fabienengels/dotfiles

cat dotfiles/archlinux/packages.list | pacman -S -

/etc/slim.conf:
default_user fabien
auto_login yes

systemctl enable slim.service

### SSD
sudo systemctl enable fstrim.timer

### Script

(Macbook only)
systemctl enable suppress-gpe66.service


### Syncthing
sudo systemctl start syncthing@fabien
sudo systemctl enable syncthing@fabien
ufw allow 21025
ufw allow 22000

### Cups
sudo pacman -S hplip libcups
sudo systemctl enable org.cups.cupsd.service
hp-setup -i 10.0.0.200

### Powersave

systemctl enable acpid
systemctl enable cpupower
systemctl enable tlp
systemctl enable tlp-sleep
systemctl enable rfkill-block@bluetooth

/etc/default/cpupower :
governor="powersave"
max_freq="2.8Ghz"

/etc/modprobe.d/i915.conf

### MacbookPro 11,2

yaourt -S mbpfan-git
systemctl enable mbpfan

/etc/sysctl.d/laptop.conf :
vm.laptop_mode = 5

/etc/udev/rules.d/70-disable_wol.rules :
ACTION=="add", SUBSYSTEM=="net", KERNEL=="eth*", RUN+="/usr/bin/ethtool -s %k wol d"

/etc/udev/rules.d/70-wifi-powersave.rules :
ACTION=="add", SUBSYSTEM=="net", KERNEL=="wlan*", RUN+="/usr/bin/iw dev %k set power_save on"

/etc/udev/rules.d/hd_power_save.rules :
ACTION=="add", SUBSYSTEM=="scsi_host", KERNEL=="host*", ATTR{link_power_management_policy}="min_power"

/etc/modprobe.d/snd_hda_intel.conf :
options snd_hda_intel power_save=1

/etc/modprobe.d/usbcore.conf :
options usbcore autosuspend=1

yaourt -S broadcom-wl

yaourt -S xf86-input-mtrack-git
/etc/X11/xorg.conf.d/00-touchpad.conf:
Section "InputClass"
    MatchIsTouchpad "on"
    Identifier      "Touchpads"
    Driver          "mtrack"
    Option          "Sensitivity" "0.64"
    Option          "FingerHigh" "5"
    Option          "FingerLow" "1"
    Option          "IgnoreThumb" "true"
    Option          "IgnorePalm" "true"
    Option          "DisableOnPalm" "true"
    Option          "TapButton1" "1"
    Option          "TapButton2" "3"
    Option          "TapButton3" "2"
    Option          "TapButton4" "0"
    Option          "ClickFinger1" "1"
    Option          "ClickFinger2" "2"
    Option          "ClickFinger3" "3"
    Option          "ButtonMoveEmulate" "false"
    Option          "ButtonIntegrated" "true"
    Option          "ClickTime" "25"
    Option          "BottomEdge" "30"
    Option          "SwipeLeftButton" "8"
    Option          "SwipeRightButton" "9"
    Option          "SwipeUpButton" "0"
    Option          "SwipeDownButton" "0"
    Option          "ScrollDistance" "75"
    Option          "VertScrollDelta" "-111"
    Option          "HorizScrollDelta" "-111"
EndSection

/etc/udev/rules.d/99-apple_broadcom_bcm2046_bluetooth.rules :
SUBSYSTEMS=="usb", ATTRS{idVendor}=="05ac", ATTRS{idProduct}=="8289", RUN+="/usr/local/sbin/remove_ignore_usb-device.sh 05ac 8289"
SUBSYSTEMS=="usb", ATTRS{idVendor}=="0a5c", ATTRS{idProduct}=="4500", RUN+="/usr/local/sbin/remove_ignore_usb-device.sh 0a5c 4500"

/etc/udev/rules.d/99-apple_cardreader.rules :
SUBSYSTEMS=="usb", ATTRS{idVendor}=="05ac", ATTRS{idProduct}=="8406", RUN+="/usr/local/sbin/remove_ignore_usb-device.sh 05ac 8406"

### Wifi
