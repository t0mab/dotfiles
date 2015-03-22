loadkeys fr

gdisk /dev/sda

o
Y
n
<ENTER>
<ENTER>
+128M
0c01
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

### Reboot !
reboot

#### SSH

pacman -S openssh ufw
systemctl enable sshd.service
systemctl start sshd.service
ufw allow 22
ufw enable


### Script

systemctl enable suppress-gpe66.service



systemctl enable wpa_supplicant@wlp3s0
systemctl enable dhcpcd@wlp3s0








hostname set-hostname namazu
locale set-locale LANG=en_US.utf8
locale set-keymap fr

/etc/systemd/network/wired.network
[Match]
Name=en*

[Network]
DHCP=v4


gummiboot install
gummiboot update



passwd fabien

/etc/slim.conf:
default_user fabien
auto_login yes

systemctl enable slim.service
systemctl enable sshd.service
systemctl enable ufw.service
ufw enable
ufw logging off

wget https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz
tar xvzf package-query.tar.gz
cd package-query
makepkg -s
cd ..
rm -rf package-query

wget https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz

yaourt -S broadcom-wl-dkms
yaourt -S xf86-input-mtrack


systemctl enable docker.socket
systemctl start docker.socket
systemctl enable docker-btrfs.service
systemctl start docker-btrfs.service
sudo systemctl enable fstrim.timer
sudo systemctl start syncthing@fabien
sudo systemctl enable syncthing@fabien

sudo timedatectl set-ntp true

sudo systemctl enable org.cups.cupsd.service
