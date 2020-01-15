
#12. configure timezone
#rm -rf /etc/localtime
#to list geographic areas:
#ls /usr/share/zoneinfo/
#pick timezome and:
#ln -sf /usr/share/zoneinfo/America/Phoenix /etc/localtime
#hwclock --systohc --utc

echo  '13. configure locale'
#nano /etc/locale.gen
#uncomment lines:
echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8

#14. configure networking

echo 'A. hostname'
#echo myhostname > /etc/hostname
echo can > /etc/hostname

echo 'B. hosts file'
#nano /etc/hosts
#Add lines:
#127.0.0.1	localhost
#::1		localhost
#127.0.1.1	myhostname.localdomain myhostname
echo '
127.0.0.1	localhost
::1		localhost
127.0.0.1	can.localdomain can' >> /etc/hosts

echo '15. create root password and user
passwd root
useradd -m -G sys,log,network,floppy,scanner,power,rfkill,users,video,storage,optical,lp,audio,wheel,adm -s /bin/bash username
passwd username
export VISUAL=nano
export EDITOR=nano
visudo /etc/sudoers
uncomment line: 
%wheel ALL=(ALL) ALL'

