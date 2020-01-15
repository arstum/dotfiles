
#20. first boot
#A. login as root
#B. check network
#ip addr
systemctl enable --now dhcpcd.service
#ping archlinux.org

#C. set up wifi - IF NEEDED
#wifi-menu
#
#D. Update system
pacman -Syyu --noc

#E. install software

#Xorg
pacman -Sy xorg xorg-apps xorg-server xorg-drivers xorg-xkill xorg-xinit xterm mesa --noc

General
pacman -Sy --needed linux-lts-headers dkms p7zip archiso haveged pacman-contrib pkgfile git diffutils jfsutils reiserfsprogs btrfs-progs f2fs-tools logrotate man-db man-pages mdadm perl s-nail texinfo which xfsprogs lsscsi sdparm sg3_utils smartmontools fuse2 fuse3 ntfs-3g exfat-utils gvfs gvfs-afc gvfs-goa gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb unrar unzip unace xz xdg-user-dirs xscreensaver grsync ddrescue dd_rescue testdisk hdparm htop rsync hardinfo bash-completion geany lsb-release polkit ufw bleachbit --noc

Multimedia
pacman -Sy --needed pulseaudio vlc simplescreenrecorder cdrtools gstreamer gst-libav gst-plugins-base gst-plugins-base-libs gst-plugins-good gst-plugins-bad gst-plugins-ugly gstreamer-vaapi gst-transcoder xvidcore frei0r-plugins cdrdao dvdauthor transcode alsa-utils alsa-plugins alsa-firmware pulseaudio-alsa pulseaudio-equalizer pulseaudio-jack ffmpeg ffmpegthumbnailer libdvdcss gimp guvcview imagemagick flac faad2 faac mjpegtools x265 x264 lame sox mencoder --noc

Networking
pacman -Sy --needed b43-fwcutter broadcom-wl-dkms intel-ucode ipw2100-fw ipw2200-fw net-tools networkmanager networkmanager-openvpn nm-connection-editor network-manager-applet wget curl firefox thunderbird wireless_tools nfs-utils nilfs-utils dhclient dnsmasq dmraid dnsutils openvpn openssh openssl samba whois iwd filezilla avahi openresolv youtube-dl vsftpd  --noc

Fonts & Themes
pacman -Sy --needed ttf-ubuntu-font-family ttf-dejavu ttf-bitstream-vera ttf-liberation noto-fonts ttf-roboto ttf-opensans opendesktop-fonts cantarell-fonts freetype2 papirus-icon-theme --noc

Printing
pacman -Sy --needed system-config-printer foomatic-db foomatic-db-engine gutenprint hplip simple-scan cups cups-pdf cups-filters cups-pk-helper ghostscript gsfonts pyqt5-common python-pillow python-pyqt5 python-pip python-reportlab --noc

#LXQt Desktop
#pacman -Sy --needed lxqt openbox obconf-qt pcmanfm-qt lxqt-sudo sddm breeze-icons qterminal kwrite partitionmanager networkmanager-qt qbittorrent pavucontrol-qt quodlibet kdenlive k3b xarchiver galculator polkit-qt5 --noc

#Plasma Desktop
#pacman -Sy --needed plasma sddm breeze-icons kwrite partitionmanager qbittorrent pavucontrol-qt quodlibet print-manager sweeper dolphin kdenlive k3b ark konsole gwenview okular kcalc  --noc

#Xfce Desktop
pacman -Sy --needed xfce4 xfce4-goodies sddm galculator gparted transmission-gtk pavucontrol xfburn asunder libburn libisofs libisoburn quodlibet pitivi xarchiver arc-gtk-theme arc-icon-theme gtk-engine-murrine adapta-gtk-theme polkit-gnome gnome-disk-utility gufw gnome-packagekit --noc

#Mate Desktop
#pacman -Sy --needed mate mate-extra mate-applet-dock sddm adapta-gtk-theme arc-gtk-theme arc-icon-theme gtk-engine-murrine gparted transmission-gtk brasero asunder quodlibet pitivi gnome-disk-utility gufw mate-polkit gnome-packagekit --noc

#Cinnamon Desktop
#pacman -Sy --needed cinnamon cinnamon-translations gnome-terminal adwaita-icon-theme adapta-gtk-theme arc-gtk-theme arc-icon-theme gtk-engine-murrine gnome-keyring sddm nemo nemo-share xed file-roller nemo-fileroller tmux tldr gparted transmission-gtk brasero asunder quodlibet pitivi gnome-disk-utility gufw polkit-gnome gnome-packagekit evince viewnior --noc


#F. enable services
systemctl enable sddm.service
systemctl enable org.cups.cupsd.service
systemctl enable NetworkManager

echo  'G. reboot'
#
#
#---------------------------
#
#Further suggestions:
#
#---------------------------
#
#Steps from: https://d3s0x.github.io/arch-installation/
#
#1. AUR Setup:
#git clone https://aur.archlinux.org/yay.git
#cd yay
#makepkg -si
#cd .. && rm -r yay
#
#
#2. If you want a graphical package manager
#Simple GTK: yay -S gnome-packagekit
#Simple Qt: yay -S apper
#Complex GTK: yay -S pamac-aur
#Complex Qt: yay -S octopi
#
#
#3. If you use a GTK desktop and want Qt apps to use your GTK Theme:
#yay -S qt5-styleplugins
#echo "export QT_QPA_PLATFORMTHEME=gtk2" >> ~/.profile
#
#
#4. Graphics card configuration tool
#
#AMD
#yay -S radeon-profile-git radeon-profile-daemon-git
#systemctl enable --now radeon-profile-daemon
#
#NVIDIA
#yay -S nvidia-settings
#
#
#----------------------------
#
#After install things to do:
#
#----------------------------
#
#1. Sync repositories, Install Reflector and Create mirrorlist
#pacman -Syy
#pacman -Sy reflector
#reflector --country 'United States' --age 15 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
#
#
#2. Automatically clean the package cache using pacman hooks:
#
#Create a file /etc/pacman.d/hooks/clean_package_cache.hook:
#
#$ sudo mkdir /etc/pacman.d/hooks
#$ sudo nano /etc/pacman.d/hooks/clean_package_cache.hook
#
#Add the following lines:
#
#[Trigger]
#Operation = Upgrade
#Operation = Install
#Operation = Remove
#Type = Package
#Target = *
#[Action]
#Description = Cleaning pacman cache...
#When = PostTransaction
#Exec = /usr/bin/paccache -rk 1
#
#Save and close the file. 
#
#
#3. Pacman can update all packages on the system with just one command. This could take quite a while depending on how up-to-date the system is. The following command synchronizes the repository databases and updates the system's packages, excluding "local" packages that are not in the configured repositories:
#
## pacman -Syu
#
#Avoid doing partial upgrades. In other words, never run pacman -Sy; instead, always use pacman -Syu. Do not use pacman -Sy package, always upgrade (with pacman -Syu) before installing a package. If experiencing trouble after an update, double-check pacman's output by looking at /var/log/pacman.log. 
#
#
#4. After upgrading you may now have packages that are no longer needed or that are no longer in the official repositories. 
#To list all packages no longer required as dependencies (orphans):
#
#$ pacman -Qdt
#
#The list of explicitly-installed packages can be shown with pacman -Qe, while the complementary list of dependencies can be shown with pacman -Qd. 
#
#To change the installation reason of an already installed package, execute:
# 
## pacman -D --asdeps package_name
#
#Use --asexplicit to do the opposite operation.
#
#
#5. Package cache
#Remove unwanted .pkg files from /var/cache/pacman/pkg/ to free up disk space. It is necessary to deliberately clean up the cache periodically to prevent the folder to grow indefinitely in size. 
#
#The paccache script, provided within the pacman-contrib package, deletes all cached versions of installed and uninstalled packages, except for the most recent 3, by default:
#
## paccache -r
#
#You can also define how many recent versions you want to keep. To retain only one past version use:
#
## paccache -rk1
#
#Add the u switch to limit the action of paccache to uninstalled packages. For example to remove all cached versions of uninstalled packages, use the following:
#
## paccache -ruk0
#
#To remove all the cached packages that are not currently installed, and the unused sync database, execute:
#
## pacman -Sc
#
#To remove all files from the cache, use the clean switch twice, this is the most aggressive approach and will leave nothing in the cache folder:
#
## pacman -Scc
#
#
#6. To keep the home directory clean from temporary files created at the wrong place, it is a good idea to manage a list of unwanted files and remove them regularly, for example with rmshit.py ( https://github.com/lahwaacz/Scripts/blob/master/rmshit.py ). rmlint can be used to find and optionally remove duplicate files, empty files, recursive empty directories and broken symlinks.
#
#7. To quickly list all the broken symlinks of your system, use:
#
## find / -xtype l -print
#
#Then inspect and remove unnecessary entries from this list.
#
#
#8. Backup the pacman database
#The following command can be used to backup the local pacman database:
#
#$ tar -cjf pacman_database.tar.bz2 /var/lib/pacman/local
#
#Store the backup pacman database file on one or more offline media, such as a USB stick, external hard drive, or CD-R.
#
#The database can be restored by moving the pacman_database.tar.bz2 file into the / directory and executing the following command:
#
## tar -xjvf pacman_database.tar.bz2
#
#
#9. Backup for directories
#
#rsync -avp --delete /home/username/my_files /location/my_files
#
#-a 
#archive preserves permissions, ownership (UID), group (GID), and timestamps
#
#-v
#verbose output
#
#-p progress indicator
#
#--delete 
#files deleted on the source are to be deleted on the backup
#
#
#
#
