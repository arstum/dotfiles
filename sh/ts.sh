#!/bin/bash
#read -p "May I ask your name: " name
#echo "pacman -S $name"
#read -n2 -p "Press any key to exit" ab
#echo "$ab" &
##exit 0
#
#read -p 'mirrorlist改华为备份后缀' bak
#cp /etc/pacman.d/mirrorlist  /etc/pacman.d/mirrorlist."$bak"

read -p 'useradd' usera
useradd -m -G sys,log,network,floppy,scanner,power,rfkill,users,video,storage,optical,lp,audio,wheel,adm -s /bin/bash "$usera"
passwd "$usera"
