#!/bin/sh
# Setup-Script to setup dotfiles

echo "This Setup is going to delete all config files,
do you want to back them up? [y/N]\n"
read dotfiles

if [$dotfiles == 'y']
then
    mkdir $HOME/dotfiles_bak
    mv $HOME/.* dotfiles_bak
    echo "Old dotfiles habe been placed in: $HOME/dotfiles_bak.\n"
    rm -r $HOME/.*
fi

echo "Have you installed Suckless Software? [y/N]\n"
read suckless

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

    rm $suckless/dwm/config.h
    cp $location/dwm/config.h $suckless/dwm/config.h
    sudo make clean install
    #TODO: Implement Functionkey Header in dwm.c (via sed -i?)

    rm $suckless/slstatus/config.h
    cp $location/slstatus/config.h $suckless/slstatus/config.h
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
