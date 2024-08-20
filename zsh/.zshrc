#         _              
#         | |             
#  _______| |__  _ __ ___ 
# |_  / __| '_ \| '__/ __|
#  / /\__ \ | | | | | (__ 
# /___|___/_| |_|_|  \___|

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
PROMPT='%3~${vcs_info_msg_0_}%f%(?.. %{$fg[red]%}E:%?%f) %# '

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

# Aliases
alias ls="ls --color"
alias la="ls -lha --color"
alias win="cd /mnt/c/Users"
alias bfg="java -jar /opt/bfg/bfg-1.14.0.jar"

# Functions

# Copy a thing into the clipboard
copy_to_clipboard() {
  echo $1 | clip.exe
}

get_path() {
  local sel_path=$(find . | fzf --reverse --border=none --no-unicode --height=20 --algo=v1 --no-color --prompt=': ')
  echo $sel_path
}

# Search for a file and copy the path to clipboard
sf() {
  local sel_file=$(get_path)

  if [[ -z "$sel_file" ]]; then
    return 1
  fi

  copy_to_clipboard "$sel_file"
}

# Search for a directory and copy the path to clipboard
sd() {
  local sel_file=$(get_path)

  if [[ -z "$sel_file" ]]; then
    return 1
  fi

  local sel_dir=$(dirname $sel_file)
  copy_to_clipboard "$sel_dir"
}
