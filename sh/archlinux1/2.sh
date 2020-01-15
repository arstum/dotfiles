
cp /etc/pacman.d/mirrorlist  /etc/pacman.d/mirrorlist.bak
echo 'Server = http://repo.huaweicloud'
echo 'Server = http://repo.huaweicloud.com/archlinux/$repo/os/$arch' >  /etc/pacman.d/mirrorlist
#9. install base packages -- linux-lts for long term support kernel, linux for standard kernel
pacstrap /mnt base base-devel linux-lts linux-firmware sysfsutils usbutils e2fsprogs dosfstools mtools inetutils netctl dhcpcd device-mapper cryptsetup nano less lvm2 dialog wpa_supplicant vim

#10. create fstab
genfstab -U /mnt >> /mnt/etc/fstab

#11. chroot into system
arch-chroot /mnt
