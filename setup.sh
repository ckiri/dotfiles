#!/bin/sh
# Setup-Script to setup dotfiles

echo ""
echo "*****************************************************"
echo "Do you want to setup paru and install packages?"
echo "[y/N]: "
read paru
echo ""
echo "Do you want to install suckless Software?"
echo "[y/N]: "
read suckless
echo "*****************************************************"
echo ""

mkdir $HOME/dotfiles_bak
cp $HOME/.* dotfiles_bak
echo "Old dotfiles habe been copied to: $HOME/dotfiles_bak.\n"
sudo rm -r $HOME/.*
mkdir $HOME/.config

# Get location of repository
location="$(pwd)"
config="$HOME/.config"

# Install Starship prompt
curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir /data/data/com.termux/files/usr/bin

# Setup Paru and install packages
if [ $paru == 'y' ]
then
    sudo pacman -S --needed base-devel
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    cd $location

    paru -S $(awk -F ',' '{print $1}' sw.csv | awk 'NR!=1 {print}')
fi

# TODO: dotfiles have to be linked at XDG specified location

# Symlink dotfiles 

# zsh specific dotfiles
ln -s $location/zsh/.zshenv $HOME/.zshenv
mkdir $config/zsh
ln -s $location/zsh/.zshrc $config/zsh/.zshrc
ln -s $location/zsh/.zprofile $config/zsh/.zprofile
ln -s $location/zsh/aliasrc $config/zsh/aliasrc

ln -s $location/.xinitrc $HOME/.xinitrc
ln -s $location/.gtkrc-2.0 $HOME/.gtkrc-2.0

mkdir $config/alacritty 
ln -s $location/alacritty/alacritty.yml $config/alacritty/alacritty.yml

mkdir $config/qtile
ln -s $location/qtile/config.py $config/qtile/config.py

mkdir $config/gtk-2.0
ln -s $location/gtk-2.0/gtkrc $config/gtk-2.0/gtkrc

mkdir $config/gtk-3.0
ln -s $location/gtk-3.0/settings.ini $config/gtk-3.0/settings.ini

mkdir $config/gtk-4.0
ln -s $location/gtk-4.0/settings.ini $config/gtk-4.0/settings.ini

mkdir $config/rofi
ln -s $location/rofi/config.rasi $config/rofi/config.rasi

mkdir $config/nvim
git clone https://github.com/ckiri/nvim $config/nvim/

ln -s $location/starship/starship.toml $config/starship.toml

# Create directory for zsh history file
mkdir -p $HOME/.cache/zsh
touch $HOME/.cache/zsh/history

# Suckless config.h files
if [$suckless == 'y']
then
    mkdir $config/suckless
    suckless=$config/suckless
    cd $suckless

    # Setup funktion for cloning and compiling suckless SW
    setup() {
        if [ $1 == sfm ]
        then
            git clone https://github.com/afify/sfm
        else
            git clone https://git.suckless.org/$1
        fi

        cd $1
        sudo make
        cp $location/$1/config.h $suckless/$1/config.h
        sudo make clean install
        cd $suckless
    }

    # Install software
    setup dmenu
    setup st
    setup slock
    setup sfm
fi

cd $location
sudo rm -r paru

exit 0
