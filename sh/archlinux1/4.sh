
echo '16. Sync repositories, Install Reflector and Create mirrorlist'
pacman -Syy --noc
pacman -Sy reflector --noc
reflector --country 'United States' --age 15 --protocol https --sort rate --save /etc/pacman.d/mirrorlist --noc

echo 'Server = http://repo.huaweicloud'
cp /etc/pacman.d/mirrorlist  /etc/pacman.d/mirrorlist.bak
echo 'Server = http://repo.huaweicloud.com/archlinux/$repo/os/$arch' >  /etc/pacman.d/mirrorlist

echo '17. install GRUB'
pacman -Sy grub efibootmgr dosfstools os-prober mtools --noc
grub-install --target=x86_64-efi  --bootloader-id=grub_uefi --recheck
grub-mkconfig -o /boot/grub/grub.cfg

echo '18. mkinitcpio -- linux-lts for long term support kernel, linux for standard kernel'
mkinitcpio -p linux-lts

#19. exit chroot
#exit (arch-chroot)
#umount -a
#reboot

