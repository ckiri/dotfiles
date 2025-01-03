# Load version control information
autoload -Uz vcs_info

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:git:*' formats ' (%b)'

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
PROMPT='$(checkssh)%3~${vcs_info_msg_0_}%(?.. E:%?) %# '

# History in cache directory:
HISTSIZE=100000
SAVEHIST=100000
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

# Aliases
alias ls="ls"
alias la="ls -lha --color"
alias vi="nvim"

# Functions
copy_to_clipboard() {
  if [[ -z "$WAYLAND_DISPLAY" ]]; then
    echo $1 | xclip
  else
    echo $1 | wl-copy -n
  fi
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

if [ -d "$HOME/.sdkman" ]; then
  export SDKMAN_DIR="$HOME/.sdkman"
  [ -s "$HOME/.sdkman/bin/sdkman-init.sh" ] && \
    source "$HOME/.sdkman/bin/sdkman-init.sh"
fi
