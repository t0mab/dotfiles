#! /bin/sh

sudo cp -v etc/* /etc
sudo cp -v modprobe.d/* /etc/modprobe.d
sudo cp -v modules-load.d/* /etc/modules-load.d
sudo cp -v rules.d/* /etc/udev/rules.d
sudo cp -v sysctl.d/* /etc/sysctl.d
sudo cp -v system/* /etc/systemd/system
sudo cp -v systemd/* /etc/systemd
sudo cp -v xorg.conf.d/* /etc/X11/xorg.conf.d
