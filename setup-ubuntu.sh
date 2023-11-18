#! /bin/bash

CURL=/usr/bin/curl
WGET=/usr/bin/wget
FILE=./_rc.txt



echo "Desea realizar la instalacion inicial? (yes / no)"
read Q1
if [[ $Q1 -eq "yes" || $Q1 -eq "y" ]]; then

    sudo apt update -y
    sudo apt install neofetch -y
    sudo apt install neovim -y
    sudo apt install kitty -y
    sudo apt install zsh -y
    sudo apt install gnome-tweaks -y
    sudo apt install python3-pip -y
    sudo apt install gnome-shell-extensions -y

    yes | zsh
    

    if [ -f "$CURL" ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash 
        
        curl -O https://go.dev/dl/go1.21.4.linux-amd64.tar.gz
    else
        sudo apt install curl -y

        if [ -f "$WGET" ]; then
            sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
            echo "WGET NVM"
            wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
            
            wget https://go.dev/dl/go1.21.4.linux-amd64.tar.gz
        fi
    fi
    
    2 | zsh

    sudo tar -xvf go1.21.4.linux-amd64.tar.gz
    sudo mv go /usr/local/bin

    # install 1password
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
    echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list
    sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
    curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
    sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
    sudo apt update && sudo apt install 1password

#profiles: ~/.bash_profile, ~/.zshrc, ~/.profile, or ~/.bashrc
## export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
## [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

    sudo apt install vlc -y

    cat $FILE >> ~/.bashrc
    cat $FILE >> ~/.zshrc
    cat $FILE >> ~/.bash_profile
    
     chsh -s $(which zsh)   

    sudo apt remove gnome-terminal -y
    sudo apt remove gnome-calendar -y
    sudo apt remove gnome-music -y
    sudo apt remove totem -y
    sudo apt remove seahorse -y # like 1password
    #sudo apt remove firefox -y
    #sudo snap remove firefox

fiv
