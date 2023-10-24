# Created by newuser for 5.8

# Load promt themes
autoload -Uz promptinit
promptinit

# Allow colors in prompt
autoload -U colors && colors

# Load version control information
autoload -Uz vcs_info

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats '(%b|%m%u%c) '

precmd() { vcs_info }

checkssh() {
  if [ -n "$SSH_CLIENT" ]; then
    echo "SSH "
  fi
}

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%B%{$fg[green]%}$(checkssh)%f%b%n@%U%B%{$fg[yellow]%}%M%b%u %{$fg[blue]%}%3~ %B%{$fg[magenta]%}${vcs_info_msg_0_}%f%b%(?.%{$fg[cyan]%}%#%f.%{$fg[red]%}%#%f) '

RPROMPT='%(?..%{$fg[red]%}[%?]%f)'

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

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
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

# Display Settings
alias @zoom="xrandr --output eDP-1 --mode 1920x1080 --rate 60"
alias @exscreen="xrandr --output eDP-1 --off --output DP-3 --primary --mode 1920x1080 --rate 60"
alias @home="xrandr --output DP-3 --primary --mode 1920x1080 --rate 60 --above eDP-1"
alias @school="xrandr --output DP-1 --mode 1920x1080 --rate 60 --same-as eDP-1 --output eDP-1 --mode 1920x1080 --rate 60"

alias ls="ls --color"
alias la="ls -lha --color"

alias sf="$HOME/.local/bin/fzfo/fzfo.sh"
alias cht="$HOME/.local/bin/cht/cht.sh"
alias alacritty="setsid -f alacritty >/dev/null 2>&1"
alias puml="setsid -f plantuml >/dev/null 2>&1"

# Options for properly displaying Java applications
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'

# zsh syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Created by `pipx` on 2023-10-24 06:34:44
export PATH="$PATH:/home/chris/.local/bin"
