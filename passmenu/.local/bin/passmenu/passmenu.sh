#!/usr/bin/bash
#
# Select a password from `pass` using tofi instead of dmenu.
# Mocks the standart implementation of passmenu. 

symbol="/usr/share/icons/Papirus-Dark/symbolic/status/dialog-password-symbolic.svg"

# Check if a wayland compositor is used, if not throw error
if [[ -n $WAYLAND_DISPLAY ]]; then
	menu=" \
		bemenu \
		--prompt passmenu: \
		--hp 8 \
		--fn monospace,9 \
		--ff #bbbbbb \
		--fb #222222 \
		--tf #bbbbbb \
		--tb #222222 \
		--nb #222222 \
		--ab #222222 \
		--hb #005577 \
		--hf #eeeeee \
		--nf #bbbbbb \
		--af #bbbbbb"
else
	notify-send -u normal "No wayland compositor used" -i $symbol
	exit 
fi

# Select all passwords in password store
password_files=$(find ~/.password-store -type f -name '*.gpg' -exec sh -c 'basename {} .gpg' \;)

# Pipe all passwords into the menu
password=$(printf '%s\n' "${password_files}" | $menu "$@")

# Exit if store is empry
[[ -n $password ]] || exit

# Copy selected password into clipboard
pass show --clip $password
