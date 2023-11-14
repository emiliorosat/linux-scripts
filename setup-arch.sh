#! /bin/bash

ISNEOFETCH=/sbin/neofetch
ISYAY=/sbin/yay
USERNAME=whoami

echo -e "Hola $USERNAME, vamos a iniciar/n"

yes | pacman -S zsh

echo "installing neofetch. /n"
if [ -f "$ISNEOFETCH" ]; then
    echo -e "neofetch already exist"
else 
    yes | sudo pacman -S neofetch
fi
# fill bashrc files
echo "neofetch" >> ~/.bashrc
echo "neofetch" >> ~/.zshrc

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

echo "/n Install Gnome? Yes/No/n"
if [[ $s1 -eq "yes" || $s1 -eq "y" ]] then
    sudo pacman -S xorg xorg-server
    sudo pacman -S gnome
    sudo pacman -S gnome-tweaks
    yes |  sudo packman -R epiphany
# nautilus # gnome file manager

echo -e "installing kitty terminal"
yes | sudo pacman -S kitty

#echo -e "installing dolphin file manager"
#yes | sudo pacman -S dolphin

git clone https://aur.archlinux.org/snapd.git
cd snapd
yes | makepkg -si
cd ..
yes | sudo rm -r snapd
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install snap-store
export PATH=$PATH:/var/lib/snapd/snap/bin 
# install vscode official
bash | yes | sudo snap install code --classic

fi





# hyprland
#yay -S gdb ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite xorg-xinput libxrender pixman wayland-protocols cairo pango seatd libxkbcommon xcb-util-wm xorg-xwayland libinput libliftoff libdisplay-info cpio