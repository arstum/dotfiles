
echo '12. configure timezone'
#rm -rf /etc/localtime
#to list geographic areas:
#ls /usr/share/zoneinfo/
#pick timezome and:
#ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#hwclock --systohc --utc

echo '13. configure locale'
#nano /etc/locale.gen
#uncomment lines:
#en_US.UTF-8 UTF-8
#locale-gen
#echo LANG=en_US.UTF-8 > /etc/locale.conf
#export LANG=en_US.UTF-8
echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf


echo '14. configure networking'

echo 'A. hostname'
echo 'echo myhostname > /etc/hostname'
echo do7main > /etc/hostname

echo 'B. hosts file'
#nano /etc/hosts
#Add lines:
#127.0.0.1	localhost
#::1		localhost
#127.0.0.1	myhostname.localdomain myhostname
echo '
127.0.0.1	localhost
::1		localhost
127.0.0.1	do7main.localdomain do7main' > /etc/hosts

echo '15. create root password and user'
passwd root
read -p "add user name :" usera
useradd -m -G sys,log,network,floppy,scanner,power,rfkill,users,video,storage,optical,lp,audio,wheel,adm -s /bin/bash usera

passwd "$usera"
export VISUAL=vim
export EDITOR=vim
#visudo /etc/sudoers
#uncomment line: 
#%wheel ALL=(ALL) ALL
echo '%wheel ALL=(ALL) ALL' >> /etc/sudoers

echo '16. Sync repositories, Install Reflector and Create mirrorlist'
pacman -Syy --noc
#pacman -Sy reflector --noc
#reflector --country 'United States' --age 15 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

echo '17. install GRUB'
pacman -Sy grub efibootmgr dosfstools os-prober mtools --noc
grub-install --target=x86_64-efi  --bootloader-id=grub_uefi --recheck
grub-mkconfig -o /boot/grub/grub.cfg

echo '18. mkinitcpio -- linux-lts for long term support kernel, linux for standard kernel'
mkinitcpio -p linux-lts

echo '19. exit chroot
exit (arch-chroot)
umount -a
reboot'

