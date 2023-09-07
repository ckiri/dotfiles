#!/usr/bin/bash
#
# Cheatsheet script using curl cht.sh/<language>/<query>

lang_list=$(<$HOME/.local/bin/cht/cht-languages)
selected=$(fzf --reverse --border=none --no-unicode --height=~10 <<< $lang_list)

if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter query: " query
query=$(tr ' ' '+' <<< $query)
echo "query: cht.sh/$selected/$query"
curl cht.sh/$selected/$query
