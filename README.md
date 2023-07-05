# Dotfiles

![Preview](pics/sc.png)

## Scope

This is my personal dotfiles repository. It's an atempt to fully automate the deployment and setup
of my personal development enviroment. The dotfiles directory structure is intended be used with GNU
Stow.

**Warning: Don't use the settings if you don't know what they are doing. Use them at your own risk!**

## How to use

1. Install [GNU Stow](https://www.gnu.org/software/stow/manual/stow.html) (Distro specific)
2. Clone the Repository to your Home directory:
```sh
cd $HOME	# make sure you are inside your home dir
git clone https://github.com/ckiri/dotfiles
cd dotfiles
```
3. Run `stow`:
```sh
stow <foo_conf_dir> <bar_conf_dir>
```
