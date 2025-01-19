#!/bin/sh

[[ -z "$SSH_CLIENT" ]] && [[ -z "$TMUX" ]] && [[ -z "$DISPLAY" ]] \
    && dwl -s ~/.local/bin/startup.sh >/dev/null 2>&1
