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
zstyle ':vcs_info:git:*' formats " %b(%m%u%c)"

precmd() { vcs_info }

# Check if connected via ssh
checkssh() {
  if [ -n "$SSH_CLIENT" ]; then
    local hostname=$(uname -n)
    echo "SSH@$hostname "
  fi
}

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%B%{$fg[yellow]%}$(checkssh)%f%b[%B%~%F{magenta}${vcs_info_msg_0_}%b%f]%# '
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

# Functions
sf() {
  local sel_file=$(find . | fzf --reverse --border=none --no-unicode --height=~20 --algo=v1 --no-color --prompt=': ' --no-scrollbar --no-separator)
  local extension="${sel_file##*.}"
  
  case "$extension" in
    sh|txt|md|c|cpp|html|css|ts|js|lua|py|tex|ini|toml|yaml|yml|h)
      $EDITOR $sel_file
      ;;
    pdf|epub)
      setsid -f zathura $sel_file >/dev/null 2>&1
      ;;
    mp4|mp3|wav|wmv|mkv|webm|mov)
      setsid -f mpv $sel_file >/dev/null 2>&1
      ;;
    jpg|jpeg|JPG|JPEG|gif|png|PNG)
      setsid -f feh -F $sel_file >/dev/null 2>&1
      ;;
    "")
      return 1
      ;;
    *)
      $EDITOR $sel_file
      ;;
  esac
}

sd() {
  local sel_file=$(find . | fzf --reverse --border=none --no-unicode --height=~20 --algo=v1 --no-color --prompt=': ' --no-scrollbar --no-separator)

  if [[ -z "$sel_file" ]]; then
    return 1
  fi

  local sel_dir=$(dirname $sel_file)
  cd $sel_dir
}

# Zsh syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
