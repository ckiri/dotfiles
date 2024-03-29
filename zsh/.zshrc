#          _              
#         | |             
#  _______| |__  _ __ ___ 
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__ 
# /___|___/_| |_|_|  \___|

# Load promt themes
autoload -Uz promptinit
promptinit

# Allow colors in prompt
autoload -U colors && colors

# Load version control information
autoload -Uz vcs_info

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:git:*' formats ' %s:(%b)'

# Define the precmd hook function
precmd() {
  vcs_info
}

# Check if connected via ssh
checkssh() {
  if [ -n "$SSH_CLIENT" ]; then
    local hostname=$(uname -n)
    echo "SSH@$hostname "
  fi
}

# Prompt
setopt PROMPT_SUBST
# Minimal prompt
PROMPT='%{$fg[yellow]%}$(checkssh)%f[%3~%{$fg[magenta]%}${vcs_info_msg_0_}%f]%(?..[%{$fg[red]%}%?%f])%# '

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select 
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Vi mode
bindkey -v
export KEYTIMEOUT=1

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` is set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Aliases
alias ls="ls --color"
alias la="ls -lha --color"

# Display Settings
alias @zoom="xrandr --output eDP-1 --mode 1920x1080 --rate 60"
alias @exscreen="xrandr --output eDP-1 --off --output DP-1 --primary --mode 2560x1440 --rate 60"
alias @home="xrandr --output DP-1 --primary --mode 2560x1440 --rate 60 --above eDP-1"
alias @clone="xrandr --output DP-1 --mode 1920x1080 --rate 60 --same-as eDP-1 --output eDP-1 --mode 1920x1080 --rate 60"

# Functions
# TODO: Optimize duplicate code snippets.

# Copy a thing into the clipboard
copy_to_clipboard() {
  if [[ $WAYLAND_DISPLAY -eq "wayland-1" ]]; then
    echo $1 | wl-copy
  else
    echo $1 | xclip -i
  fi
}

# Search for a file and copy the path to clipboard
sf() {
  local sel_file=$(find . | fzf --reverse --border=none --no-unicode --height=~20 --algo=v1 --no-color --prompt=': ' --no-scrollbar --no-separator)

  if [[ -z "$sel_file" ]]; then
    return 1
  fi

  copy_to_clipboard "$sel_file"
}

# Search for a directory and copy the path to clipboard
sd() {
  local sel_file=$(find . | fzf --reverse --border=none --no-unicode --height=~20 --algo=v1 --no-color --prompt=': ' --no-scrollbar --no-separator)

  if [[ -z "$sel_file" ]]; then
    return 1
  fi

  local sel_dir=$(dirname $sel_file)
  copy_to_clipboard "$sel_dir"
}

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

