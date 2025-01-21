#!/bin/sh

[[ -z "$SSH_CLIENT" ]] && [[ -z "$TMUX" ]] && [[ -z "$DISPLAY" ]] \
    && niri --session >/dev/null 2>&1
