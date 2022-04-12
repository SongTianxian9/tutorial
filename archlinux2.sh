pacman -Syyu
pacman -S fish
useradd -m -G wheel -s /usr/bin/fish elijah
# passwd elijah
# vim /etc/sudoers  --> uncomment wheel ALL line
# vim /etc/bluetooth/man.conf --> uncomment AutoEnable=true && DiscoverableTimeout=0
echo -e '[archlinuxcn]\nServer = https://mirrors.bfsu.edu.cn/archlinuxcn/$arch\nServer = https://mirrors.ustc.edu.cn/archlinuxcn/$arch\n' >> /ect/pacman.conf
pacman -Syyu
pacman -S archlinux-keyring archlinuxcn-keyring
pacman -S gnome gnome-tweaks
systemctl enable gdm

pacman -S clash firefox gst-libav
pacman -S fcitx5-im fcitx5-chinese-addons fcitx5-rime fcitx5-qt fcitx5-gtk fcitx5-nord

echo -e "GTK_IM_MODULE=fcitx\nQT_IM_MODULE=fcitx\nXMODIFIERS=@im=fcitx\nSDL_IM_MODULE=fcitx

pacman -S noto-fonts-emoji wqy-microhei wqy-zenhei wqy-bitmapfont ttf-arphic-ukai ttf-arphic-uming

systemctl enable bluetooth
