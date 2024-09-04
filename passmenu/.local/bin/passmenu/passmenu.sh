#!/usr/bin/bash
#
# Select a password from `pass` using tofi instead of dmenu.
# Mocks the standart implementation of passmenu. 

symbol="/usr/share/icons/Papirus-Dark/symbolic/status/dialog-password-symbolic.svg"

# Check if a wayland compositor is used, if not throw error
if [[ -n $WAYLAND_DISPLAY ]]; then
	menu="tofi"
else
	notify-send -u normal "No wayland compositor used" -i $symbol
	exit 1
fi

# Select all passwords in password store
password_files=$(find ~/.password-store -type f -name '*.gpg' -exec sh -c 'basename {} .gpg' \;)

# Pipe all passwords into the menu
password=$(printf '%s\n' "${password_files}" | $menu "$@")

# Exit if store is empty
[[ -n $password ]] || exit

# Copy selected password into clipboard
pass show --clip $password
