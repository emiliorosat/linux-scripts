#! /bin/bash

CURL=/usr/bin/curl
WGET=/usr/bin/wget
FILE=./nvm.txt

echo "Desea realizar la instalacion inicial? (yes / no)"
read Q1
if [ $Q1 -eq "yes" || $Q1 -eq "y"]; then

    sudo apt update -y
    sudo apt install neofetch -y
    sudo apt install neovim -y
    sudo apt install kitty -y
    sudo apt install zsh -y
    sudo apt install gnome-tweaks-y
    sudo apt install python3-pip

    zsh

    if [ -f "$CURL" ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -y
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash -y
        curl -O https://go.dev/dl/go1.21.4.linux-amd64.tar.gz
        
    fi
    
    if [ -f "$WGET" ]; then
        sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
        wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
        wget https://go.dev/dl/go1.21.4.linux-amd64.tar.gz
    
    fi

    sudo tar -xvf go1.21.4.linux-amd64.tar.gz
    sudo mv go /usr/local/bin

#profiles: ~/.bash_profile, ~/.zshrc, ~/.profile, or ~/.bashrc
## export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
## [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

    cat $FILE >> ~/.bashrc
    cat $FILE >> ~/.zshrc
    cat $FILE >> ~/.bash_profile

fi