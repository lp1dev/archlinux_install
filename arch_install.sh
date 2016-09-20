#!/bin/sh

#Setting up time
echo "time : format '12:00'"
read input_time
timedatectl set-time $input_time

#partitioning disks
cfdisk

#formatting
echo "/ partition : "
read root_partition
echo "/boot partition :"
read boot_partition
mkfs.ext2 $boot_partition
mkfs.ext4 $root_partition
mount $root_partition /mnt
mkdir /mnt/boot
mount $boot_partition /mnt/boot

echo "/swap partition : "
read swap_partition
swapon $swap_partition

#installing system
echo "installing system..."
pacstrap /mnt base base-devel

#generating fstab
echo "generating fstab"
genfstab -U -p /mnt >> /mnt/etc/fstab
curl http://lp1.eu/public/arch_conf.sh > /mnt/arch_conf.sh

#chrooting inside the created system
arch-chroot /mnt sh ./arch_conf.sh

#umounting /mnt
umount -R /mnt
poweroff
