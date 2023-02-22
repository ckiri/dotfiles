#!/bin/sh
# Setup-Script to setup dotfiles

echo "This Setup is going to delete all config files,\
do you want to back them up?\n"
echo "[y/N]: "
read dotfiles
echo "\n"

echo "Do you want to install paru and install packages?\n"
echo "[y/N]: "
read paru
echo "\n"
# TODO: csv file with list of packages

echo "Have you installed Suckless Software?\n"
echo "[y/N]: "
read suckless
echo "\n"

if [$dotfiles == 'y']
then
    mkdir $HOME/dotfiles_bak
    mv $HOME/.* dotfiles_bak
    echo "Old dotfiles habe been placed in: $HOME/dotfiles_bak.\n"
    rm -r $HOME/.*
fi

# Get location of repository
location="$(pwd)"

config="$HOME/.config"

# Symlink dotfiles in $HOME/
ln -s $location/.zshrc $HOME/.zshrc
ln -s $location/.xinitrc $HOME/.xinitrc
ln -s $location/.gtkrc-2.0 $HOME/.gtkrc-2.0

# Symlink dotfiles in $HOME/.config/
mkdir -p $config/alacritty # -p --> Create parent folder '.config'
ln -s $location/alacritty/alacritty.yml $config/alacritty/alacritty.yml

mkdir $config/qtile
ln -s $location/qtile/config.py $config/qtile/config.py

mkdir $config/gtk-3.0
ls -s $location/gtk-3.0/settings.ini $config/gtk-3.0/settings.ini

mkdir $config/gtk-4.0
ls -s $location/gtk-4.0/settings.ini $config/gtk-4.0/settings.ini

mkdir $config/rofi
ln -s $location/rofi/config.rasi $config/rofi/config.rasi

mkdir $config/nvim
git clone https://github.com/ckiri/nvim $config/nvim/

ln -s $location/starship/starship.toml $config/starship.toml
ln -s $location/aliasrc $config/aliasrc

# Suckless config.h files
if [$suckless == 'y']
then
    suckless=$config/suckless

    # Symlinking *.h files in c is not working due to dangling Symlink,
    # therefore copy files manually into repos

    rm $suckless/st/config.h
    cp $location/st/config.h $suckless/dwm/config.h
    sudo make clean install
    
    rm $suckless/dmenu/config.h
    cp $location/dmenu/config.h $suckless/dwm/config.h
    sudo make clean install

    rm $suckless/slock/config.h
    cp $location/slock/config.h $suckless/slock/config.h
    sudo make clean install

    rm $suckless/sfm/config.h
    cp $location/sfm/config.h $suckless/sfm/config.h
    sudo make clean install
fi
