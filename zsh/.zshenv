export EDITOR="/usr/bin/gvim"
export BROWSER="/usr/bin/firefox"

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export ANDROID_HOME="$XDG_DATA_HOME"/android
export HISTFILE="${XDG_STATE_HOME}"/bash/history
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export PLATFORMIO_CORE_DIR="$XDG_DATA_HOME"/platformio
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority

# Options for properly displaying Java applications
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'

# Created by `pipx` on 2023-10-24 06:34:44
export PATH="$PATH:/home/chris/.local/bin"

export QT_SCALE_FACTOR=1.2
export WINIT_X11_SCALE_FACTOR=1
export LS_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
