#! /bin/sh

cp -v network/* /etc/systemd/network
systemctl enable systemd-networkd.service
systemctl start systemd-networkd.service

pacman -Syu
pacman -S $(cat packages.list | xargs)

sudo cp -v etc/* /etc
sudo cp -v modprobe.d/* /etc/modprobe.d
sudo cp -v modules-load.d/* /etc/modules-load.d
sudo cp -v rules.d/* /etc/udev/rules.d
sudo cp -v sysctl.d/* /etc/sysctl.d
sudo cp -v system/* /etc/systemd/system
sudo cp -v systemd/* /etc/systemd
sudo cp -v xorg.conf.d/* /etc/X11/xorg.conf.d
sudo cp -v polkit/* /etc/polkit-1/rules.d

hostnamectl set-hostname $(hostname)
localectl set-locale LANG=en_US.utf8
localectl set-keymap fr
localectl set-x11-keymap fr

systemctl enable postgresql
systemctl enable mongodb
systemctl enable slim
systemctl enable sshd
systemctl enable ufw
systemctl enable fstrim.timer
systemctl enable docker.socket
systemctl enable syncthing@fabien
systemctl enable devmon@fabien
timedatectl set-ntp true
ufw enable
ufw logging off
ufw allow 22
ufw allow 22000
ufw allow 21025

chmod +x /usr/bin/udevil

useradd -m -G wheel,rfkill,games,network,storage,users,usbmux,docker fabien
