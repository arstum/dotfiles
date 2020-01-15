echo '
---------------------------------------------------

Arch Install - Multiple Choice Desktop Example

---------------------------------------------------

6. cfdisk - UEFI GPT
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
'
#read -p 'Go on?' goon
#if goon='n'
	#exit 0
#read -p 'Disk is sda or sdb?' sdab

echo '1. set keyboard layout - default is US'
#** Available layouts can be listed with:
#ls /usr/share/kbd/keymaps/i386/**/*.map.gz | less
#** To modify the layout, append a corresponding file name to loadkeys, UK for example:
#loadkeys uk.map.gz
#
echo '2. verify boot mode (UEFI or Legacy):'
#ls /sys/firmware/efi/efivars
#** If the directory does not exist, the system may be booted in Legacy BIOS Mode
#
echo '3. check internet connection:'
#ping archlinux.org
#
echo '3a. set up wifi - IF NEEDED'
#wifi-menu
#
echo '4. update system clock'
timedatectl set-ntp true

echo '5. Sync repositories, Install Reflector and Create mirrorlist, & install latest keyring'
read -p 'mirrorlist huawei back name:' bak
cp /etc/pacman.d/mirrorlist  /etc/pacman.d/mirrorlist."$bak"
echo 'Server = http://repo.huaweicloud'
echo 'Server = http://repo.huaweicloud.com/archlinux/$repo/os/$arch' >  /etc/pacman.d/mirrorlist

pacman -Syy --noc
pacman -Sy archlinux-keyring --noc
echo 'pacman -Sy reflector --noc'
echo 'reflector --country 'United States' --age 15 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'

echo '9. install base packages -- linux-lts for long term support kernel, linux for standard kernel'
pacstrap /mnt base base-devel linux-lts linux-firmware sysfsutils usbutils e2fsprogs dosfstools mtools inetutils netctl dhcpcd device-mapper cryptsetup nano less lvm2 dialog wpa_supplicant vim

echo '10. create fstab'
genfstab -U /mnt >> /mnt/etc/fstab

echo '11. chroot into system
arch-chroot /mnt'

