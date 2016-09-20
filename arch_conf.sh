#!/bin/sh
export LANG=fr_FR.UTF-8
export LC_ALL=$LANG

#User and machine configuration
echo "[Configuration]"
echo "hostname : "
read hostname
echo $hostname > /etc/hostname

#timezone configuration
echo "timezone configuration..."
rm -fr /etc/localtime
ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime
locale-gen
echo LANG="fr_FR.UTF-8" > /etc/locale.conf
echo KEYMAP='us intl' > /etc/vconsole.conf

#passwd configuration
passwd

#grub installation
pacman -S grub gptfdisk os-prober
echo "grub install partition :"
read root_partition
grub-install $root_partition
grub-mkconfig -o /boot/grub/grub.cfg
exit
umount -R /mnt
