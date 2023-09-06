# Created by newuser for 5.8

# Allow colors in prompt
autoload -U colors && colors

# Load version control information
autoload -Uz vcs_info

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' (%b)'

precmd() { vcs_info }

checkssh() {
  if [ -n "$SSH_CLIENT" ]; then
    echo "(SSH) "
  fi
}

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%B%{$fg[green]%}$(checkssh)%f%b%n@%B%{$fg[yellow]%}%M%b %{$fg[cyan]%}%3~%B%{$fg[magenta]%}${vcs_info_msg_0_}%b%f %(?.%#.%{$fg[red]%}[$?]↑%f %#) '

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
alias @school="xrandr --output DP-3 --mode 1920x1080 --rate 60 --same-as eDP-1 --output eDP-1 --mode 1920x1080 --rate 60"

alias ls="ls --color"

alias sf="$HOME/.local/bin/fzfo/fzfo.sh"
alias alacritty="setsid -f alacritty >/dev/null 2>&1"
alias puml="setsid -f plantuml >/dev/null 2>&1"

# Options for properly displaying Java applications
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'

# Git prompt
source /usr/share/git/git-prompt.sh

# zsh syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#export NVM_DIR="$HOME/.config/nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#  Load Angular CLI autocompletion.
#source <(ng completion script)

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#[[ -s "/home/chris/.sdkman/bin/sdkman-init.sh" ]] && source "/home/chris/.sdkman/bin/sdkman-init.sh"
