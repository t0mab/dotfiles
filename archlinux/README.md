loadkeys fr

gdisk /dev/sda

o
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

mkfs.vfat -n BOOT -F 32 /dev/sda1
cryptsetup -v --cipher aes-xts-plain64 --key-size 256 -y luksFormat /dev/sda2
cryptsetup luksOpen /dev/sda2 archlinux
pvcreate /dev/mapper/archlinux
vgcreate vgroot /dev/mapper/archlinux
lvcreate -L 16G -n swap vgroot
lvcreate -L 10G -n docker vgroot
lvcreate -L 500G -n root vgroot
vgchange --available y

mkswap -L swap /dev/mapper/vgroot-swap
mkfs.btrfs -L docker /dev/mapper/vgroot-docker
mkfs.ext4 -m 1 -L root /dev/mapper/vgroot-root

mount /dev/mapper/vgroot-root /mnt
mkdir -p /mnt/boot /mnt/var/lib/docker
mount /dev/sda1 /mnt/boot
mount /dev/mapper/vgroot-docker /mnt/var/lib/docker
swapon /dev/mapper/vgroot-swap

pacstrap /mnt
genfstab -p /mnt >> /mnt/etc/fstab
arch-chroot /mnt
pacman -Syu
pacman -S vim
echo kyufix > /etc/hostname
ln -sf /usr/share/zoneinfo/Europe/Paris
locale-gen

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
options cryptdevice=/dev/sda2:vgroot:allow-discards root=/dev/mapper/vgroot-root rw

pacman -S openssh
systemctl enable sshd.service
systemctl start sshd.service

systemctl enable suppress-gpe66.service



systemctl enable wpa_supplicant@wlp3s0
systemctl enable dhcpcd@wlp3s0








hostname set-hostname namazu
locale set-locale LANG=en_US.utf8
locale set-keymap fr
locale-gen
ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime

/etc/systemd/network/wired.network
[Match]
Name=en*

[Network]
DHCP=v4


gummiboot install
gummiboot update

mkinitcpio -p linux


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
