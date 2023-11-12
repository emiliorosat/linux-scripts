#! /bin/bash

ISNEOFETCH=/sbin/neofetch
ISYAY=/sbin/yay
USERNAME=whoami

echo -e "Hola $USERNAME, vamos a iniciar/n"

echo "installing neofetch. /n"
if [ -f "$ISNEOFETCH" ]; then
    echo -e "neofetch already exist"
else 
    sudo pacman -S neofetch
fi
# fill bashrc files
echo "neofetch" >> ~/.bashrc

echo "installing yay. /n"
if [ -f "$ISYAY" ]; then
    echo -e "Yay already exist"
else 
    cd ~
    mkdir yaytempinstall && cd yaytempinstall
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ../..
    sudo rm -r yaytempinstall
fi
