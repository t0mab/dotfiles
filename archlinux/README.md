loadkeys fr

gdisk /dev/sda

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

mkfs.vfat -n BOOT -F 32 /dev/sda1
cryptsetup -v --cipher aes-xts-plain64 --key-size 256 -y luksFormat /dev/sda2
cryptsetup luksOpen /dev/sda2 archlinux
mkfs.btrfs -L ROOT /dev/mapper/archlinux
OR
mkfs.ext4 -L ROOT /dev/mapper/archlinux

mount /dev/mapper/archlinux /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

pacstrap /mnt
genfstab -p /mnt >> /mnt/etc/fstab
arch-chroot /mnt
pacman -Syu
pacman -S vim
echo kyufix > /etc/hostname
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
echo "en_US.UTF-8 UTF-8 > /etc/locale.gen"
locale-gen
passwd

mkinitcpio.conf :
HOOKS="base udev autodetect modconf block consolefont keymap keyboard encrypt filesystems fsck"

vconsole.conf :
KEYMAP=fr
FONT=sun12x22

mkinitcpio -p linux

###### UEFI :
pacman -S gummiboot
gummiboot install
mkdir -p /boot/loader/entries

/boot/loader/loader.conf
timeout 10
default Archlinux

/boot/loader/entries/archlinux.conf
title Archlinux
linux vmlinuz-linux
initrd initramfs-linux.img
options cryptdevice=/dev/sda2:archlinux:allow-discards root=/dev/mapper/archlinux rw

###### BIOS :
pacman -S syslinux gptfdisk
syslinux-install_update -i -m -a

/boot/syslinux/syslinux.cfg :
APPEND cryptdevice=/dev/sda2:archlinux:allow-discards root=/dev/mapper/archlinux rw

### Network
systemctl enable systemd-networkd
systemctl enable systemd-resolved
rm /etc/resolv.conf
ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf

/etc/systemd/network/wired.network
[Match]
Name=en*

[Network]
DHCP=v4

### Reboot !
reboot

#### SSH

pacman -S openssh ufw
systemctl enable sshd.service
ufw allow 22
ufw enable
systemctl enable ufw

### Settings

hostname set-hostname namazu
localectl set-locale LANG=en_US.utf8
localectl set-keymap fr
localectl set-x11-keymap fr
timedatectl set-ntp true

### User

pacman -S zsh
useradd -m -s /usr/bin/zsh -G wheel,uucp,rfkill,games,lock,network,storage,users,usbmux,docker fabien
passwd fabien

### Docker

pacman -S docker
gpasswd -a fabien docker
systemctl enable docker.socket
systemctl start docker.socket

### Install them all !!!

### Yaourt

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
