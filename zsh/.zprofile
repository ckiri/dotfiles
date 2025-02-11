#!/bin/sh

[[ -z "$SSH_CLIENT" ]] && [[ -z "$TMUX" ]] && [[ -z "$DISPLAY" ]] \
    && sway 2>&1
