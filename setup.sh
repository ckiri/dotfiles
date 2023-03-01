#!/bin/sh
# script to setup .files
echo ""
echo "*******************************************************"
echo ""
echo "Do you want to backup dotfiles?"
echo "[y/N]: "
read bak
echo ""
echo "Do you want to setup paru and install packages?"
echo "[y/N]: "
read paru
echo ""
echo "Do you want to install suckless software?"
echo "[y/N]: "
read suckless
echo ""
echo "Do you want to change the shell to zsh?"
echo "[y/N]: "
read shell
echo "*******************************************************"
echo ""

# backup old Dotfiles
if [ $bak == 'y' ]
then
    echo ""
    echo "*******************************************************"
    echo "Backing up old Dotfiles..."
    mkdir $HOME/dotfiles_bak
    cp -r -v $HOME/.* dotfiles_bak
    echo "Old dotfiles have been copied to: $HOME/dotfiles_bak.\n"
    echo "*******************************************************"
    echo ""
fi

sudo rm -r $HOME/.*
mkdir $HOME/.config

# change shell to zsh
if [ shell == 'y' ]
then
    echo ""
    echo "*******************************************************"
    echo "Changing shell to zsh"
    chsh -s /usr/bin/zsh
    echo "*******************************************************"
    echo ""
fi

# get location of repository
location="$(pwd)"
config="$HOME/.config"

# setup paru and install packages
if [ $paru == 'y' ]
then
    sudo pacman -S --needed base-devel
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    cd $location

    paru -S $(awk -F ',' '{print $1}' sw.csv | awk 'NR!=1 {print}')
fi

# symlink dotfiles 
ln -s $location/zsh/.zshenv $HOME/.zshenv
mkdir $config/zsh
ln -s $location/zsh/.zshrc $config/zsh/.zshrc
ln -s $location/zsh/.zprofile $config/zsh/.zprofile
ln -s $location/zsh/aliasrc $config/zsh/aliasrc

rm $HOME/.xinitrc
ln -s $location/xinit/.xinitrc $HOME/.xinitrc
ln -s $location/.gtkrc-2.0 $HOME/.gtkrc-2.0

mkdir $config/alacritty 
ln -s $location/alacritty/alacritty.yml $config/alacritty/alacritty.yml

mkdir $config/qtile
ln -s $location/qtile/config.py $config/qtile/config.py

mkdir $config/gtk-2.0
ln -s $location/gtk-2.0/gtkrc-2.0 $config/gtk-2.0/gtkrc
# TODO: check format of file naming

mkdir $config/gtk-3.0
ln -s $location/gtk-3.0/settings.ini $config/gtk-3.0/settings.ini

mkdir $config/gtk-4.0
ln -s $location/gtk-4.0/settings.ini $config/gtk-4.0/settings.ini

mkdir $config/picom
ln -s $location/picom/picom.conf $config/picom/picom.conf

mkdir $config/nvim
git clone https://github.com/ckiri/nvim $config/nvim/

ln -s $location/starship/starship.toml $config/starship.toml

ln -s $location/dirs/user-dirs.dirs $config/user-dirs.dirs

# create directory for zsh history file
mkdir -p $HOME/.cache/zsh
touch $HOME/.cache/zsh/history

# setup suckless sw
if [ $suckless == 'y' ]
then
    mkdir $config/suckless
    suckless=$config/suckless
    cd $suckless

    # function for cloning and compiling suckless sw
    setup() {
        if [ $1 == sfm ]
        then
            git clone https://github.com/afify/sfm
        else
            git clone https://git.suckless.org/$1
        fi
        # TODO: if statement with automatic patches for st
        cd $1
        sudo make
        cp $location/$1/config.h $suckless/$1/config.h                # copy config files in source folder
        sudo make clean install
        cd $suckless
    }

    # Install software
    setup dmenu
    setup slock
    setup sfm
fi

cd $location
sudo rm -r paru

exit
