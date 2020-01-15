##ping baidu.com -c 2
#timedatectl set-ntp true
##cp /etc/pacman.d/mirrorlist  /etc/pacman.d/mirrorlist.bak
#echo 'Server = http://repo.huaweicloud'
#echo 'Server = http://repo.huaweicloud.com/archlinux/$repo/os/$arch' >  /etc/pacman.d/mirrorlist
#pacman -Syy --noc
#pacman -Sy archlinux-keyring --noc
#pacman -Sy reflector --noc
#reflector --country 'United States' --age 15 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
echo '6. cfdisk - UEFI GPT
cfdisk /dev/sda
sda1: efi system, sda2: swap, sda3: root, sda4: home
efi system partition: type: EFI System, size: 512Mb, format: fat32
7. format partitions
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda3
mkfs.ext4 /dev/sda4 
mkswap /dev/sda2
swapon /dev/sda2
8. mount partitions
mount /dev/sda3 /mnt
mkdir -p /mnt/boot/EFI
mount /dev/sda1 /mnt/boot/EFI
mkdir /mnt/home
mount /dev/sda4 /mnt/home
cp  cc/dd/1.sh'

