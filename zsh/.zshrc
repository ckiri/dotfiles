# Created by newuser for 5.8

# Git integration
source /home/chris/.config/zsh/gitprompt

# Enable colors and change prompt:
#autoload -U colors && colors
#setopt PROMPT_SUBST
#PROMPT='%/%B%F{#ff00ff}$(__git_ps1 " (%s)")%f%b%(?.%#.%B%F{red}%#%f%b) ' 
#PROMPT='%B%F{cyan}%/%f%b %B%F{yellow}%n%f%b%B%F{#ff00ff}$(__git_ps1 " (%s)")%f%b %(?.%B%F{green}%#%f%b.%B%F{red}%#%f%b) '
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
source /home/chris/.config/zsh/vimode

# Aliases
source /home/chris/.config/zsh/aliasrc

# zsh syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"
