#! /bin/sh
# setup script for wsl(Debian/Ubuntu)

# Update and upgrade packages
sudo apt update && sudo apt upgrade

# Install neccessary packages
sudo apt install \
  zsh \
  tmux \
  git \
  curl \
  jq \
  ranger \
  stow \
  python3 \
  man-db \
  gpg \
  fzf \
  tree \
  pass

# Clone and symlink the dotfiles with stow
git clone --depth 1 --branch wsl https://github.com/ckiri/dotfiles ~/.dotfiles
cd ~/.dotfiles
stow dirs nvim tmux zsh

# Download & add Neovim to $PATH variable
mkdir ~/downloads
cd ~/downloads
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.zshenv

# Create a history file
mkdir -p ~/.cache/zsh
touch ~/.cache/zsh/history

# Setup Git
echo "Setting up Git:"
read -p "Please enter your Name: " NAME
git config --global user.name "$NAME"
read -p "Please enter your E-Mail: " EMAIL
git config --global user.email "$EMAIL"

# Generate a gpg key-pair for pass
echo "\n"
echo "Generate a GPG key-pair for pass.\n(standard UNIX password manager)"
gpg --full-gen-key

# Init pass
echo "This next step is initializing pass."
read -p "Please enter the E-Mail of your GPG-ID: " EMAIL
pass init $EMAIL

# Change the shell to Z-Shell
echo "Switching shell from $SHELL to Z-Shell.\nAfter that the session is going to be left."
chsh -s $(which zsh)

exit
