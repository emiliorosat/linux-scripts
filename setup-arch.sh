#! /bin/bash

ISNEOFETCH=/sbin/neofetch
ISYAY=/sbin/yay
USERNAME=whoami

echo -e "Hola $USERNAME, vamos a iniciar/n"

echo "installing neofetch. /n"
if [ -f "$ISNEOFETCH" ]; then
    echo -e "neofetch already exist"
else 
    yes | sudo pacman -S neofetch
fi
# fill bashrc files
echo "neofetch" >> ~/.bashrc

echo "installing yay. /n"
if [ -f "$ISYAY" ]; then
    echo -e "Yay already exist"
else 
    mkdir yaytempinstall && cd yaytempinstall
    git clone https://aur.archlinux.org/yay.git
    cd yay
    yes | makepkg -si
    cd ../..
    sudo rm -r yaytempinstall
fi

# install nvm
echo "/nInstalling NVM/n"
git clone https://github.com/nvm-sh/nvm && cd nvm
./install.sh
cd ..
yes | sudo rm -r nvm

# hyprland
#yay -S gdb ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite xorg-xinput libxrender pixman wayland-protocols cairo pango seatd libxkbcommon xcb-util-wm xorg-xwayland libinput libliftoff libdisplay-info cpio