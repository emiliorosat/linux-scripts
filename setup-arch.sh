#! /bin/bash

ISNEOFETCH=/sbin/neofetch
ISYAY=/sbin/yay
ISGIT=/sbin/git
ISVIM=/sbin/nvim
ISWGET=/sbin/wget
USERNAME=whoami

echo -e "Hola $USERNAME, vamos a iniciar/n"

echo "\n\nInstalling git. \n"
if [ -f "$ISGIT" ]; then
    echo -e "already exist"
else 
    yes | sudo pacman -S git
fi

echo "\n\nInstalling neovim \n"
if [ -f "$ISVIM" ]; then
    echo -e "already exist"
else 
    yes | sudo pacman -S neovim
fi

echo "\n\nInstalling wget \n"
if [ -f "$ISWGET" ]; then
    echo -e "already exist"
else 
    yes | sudo pacman -S wget
fi

yes | pacman -S zsh
zsh
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


echo "\ninstalling neofetch.\n"
if [ -f "$ISNEOFETCH" ]; then
    echo -e "already exist"
else 
    yes | sudo pacman -S neofetch
    # fill bashrc files
    echo "neofetch" >> ~/.bashrc
    echo "neofetch" >> ~/.zshrc
fi


echo "installing yay. /n"
if [ -f "$ISYAY" ]; then
    echo -e "Yay already exist"
else 
    git clone https://aur.archlinux.org/yay.git
    cd yay
    yes | makepkg -si
    cd ..
    sudo rm -r yay
fi

# install nvm
echo "/nInstalling NVM/n"
git clone https://github.com/nvm-sh/nvm && cd nvm
./install.sh
cd ..
yes | sudo rm -r nvm

yes | sudo pacman -S mesa
yes | sudo pacman -S xf86-video-intel
yes | sudo pacman -S vulkan-intel
yes | sudo pacman -S wayland


echo "\nInstall Gnome? Yes/No\n"
read GNOME
if [[ $GNOME -eq "yes" || $GNOME -eq "y" ]] then
    sudo pacman -S xorg xorg-server xorg-xwayland
    sudo pacman -S gnome
    sudo pacman -S gnome-tweaks
    yes |  sudo packman -R epiphany
    # nautilus # gnome file manager
    sudo systemctl enable gdm.service

    echo -e "installing kitty terminal"
    yes | sudo pacman -S kitty

    #yes | sudo pacman -S ly
    #sudo systemctl enable ly.service

    #echo -e "installing dolphin file manager"
    #yes | sudo pacman -S dolphin

    git clone https://aur.archlinux.org/snapd.git
    cd snapd
    yes | makepkg -si
    cd ..
    yes | sudo rm -r snapd
    sudo systemctl enable --now snapd.socket
    sudo ln -s /var/lib/snapd/snap /snap
    
    bash
    #sudo snap install snap-store
    export PATH=$PATH:/var/lib/snapd/snap/bin 
    
    # install vscode official
    bash | yes | sudo snap install code --classic

fi


systemctl reboot




# hyprland
#yay -S gdb ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite xorg-xinput libxrender pixman wayland-protocols cairo pango seatd libxkbcommon xcb-util-wm xorg-xwayland libinput libliftoff libdisplay-info cpio