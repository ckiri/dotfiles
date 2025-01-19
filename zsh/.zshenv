export EDITOR="/usr/bin/vim"
export BROWSER="/usr/bin/firefox"
export TERMINAL="/usr/bin/alacritty"

export XKB_DEFAULT_LAYOUT=de

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export HISTFILE="${XDG_STATE_HOME}/bash/history"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export GRADLE_USER_HOME="${XDG_DATA_HOME}/gradle"
export GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtk-2.0/gtkrc"
export PLATFORMIO_CORE_DIR="${XDG_DATA_HOME}/platformio"
export XAUTHORITY="${XDG_RUNTIME_DIR}/Xauthority"

# Options for properly displaying Java applications
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'

export PATH="${PATH}:${HOME}/.local/bin"
