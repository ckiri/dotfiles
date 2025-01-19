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
  if test -n "$SSH_CLIENT"
  then
    local hostname=$(uname -n)
    echo "SSH@$hostname "
  fi
}

# Prompt
setopt PROMPT_SUBST
PROMPT='$(checkssh)%3~${vcs_info_msg_0_}%(?.. E:%?) %# '

# History in cache directory:
setopt SHARE_HISTORY
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
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-lone-or-history
bindkey -v '^?' backward-delete-char

export FZF_DEFAULT_OPTS="
--ansi
--layout=reverse
--no-color
--no-unicode
--no-scrollbar
--no-bold
--height=25
--pointer=' '
--marker=' '
--marker-multi-line=''
"

# Loads FZF keybindings, replacing native reverse search etc with FZF
test -f /usr/share/fzf/key-bindings.zsh && source /usr/share/fzf/key-bindings.zsh
