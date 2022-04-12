# archlinux install guide

# vim /etc/pacman.d/mirrorlist
#systemctl stop reflector
#ping baidu.com
#timedatectl set-ntp true
# fdisk /dev/sda      # create new GPT
# fdisk /dev/nvmen0   # create new GPT
# fdisk /dev/nvmen0   # p1 --> efi, p2 --> lvm
# fdisk /dev/sda      # p --> lvm

pvcreate /dev/sda
pvcreate dev/nvmen0p2
vgcreate VolGroup00 /dev/sda /dev/nvmen0p2
lvcreate -L 16G VolGroup00 -n lvolswap /dev/nvmen0p2
lvcreate -l 100%FREE VoLGroup00 -n lvolroot

modprobe dm_mod
vgscan
vgchange -ay

mkfs.fat -F 32 /dev/nvmen0p1
mkfs.ext4 /dev/VolGroup00/lvolroot
mkswap /dev/VolGroup00/lvolswap
mount /dev/VolGroup00/lvolroot /mnt
mount --mkdir /dev/nvmen0p1 /mnt/boot
swapon /dev/VolGroup00/lvolswap

pacstrap /mnt base linux linux-firmware lvm2 vim networkmanager man man-db man-pages texinfo e2fsprogs
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt

ln -sf /usr/share/zoneinfo/Asin/Shanghai /etc/localtime
hwclock --systohc
echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf

hostnamectl set-hostname arch
echo -e "127.0.0.1        localhost\n::1              localhost\n127.0.1.1        arch\n" > /etc/hosts
systemctl enable NetworkManager

# vim /etc/mkinitcpio.conf --> add lvm2 between block and filesystems , line $HOOKS
#mkinitcpio -p
# passwd
#pacman -S intel-ucode
#pacman -S grub efibootmgr
#grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
#grub-mkconfig -o /boot/grub/grub.cfg

# don't uncomment
#exit
#umount -R /mnt
#reboot

