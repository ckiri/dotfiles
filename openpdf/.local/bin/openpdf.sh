#!/bin/sh
#
# Open PDFs using zathura-pdf-poppler

file=$(find ~/Documents -name "*.pdf" | menu.sh) 
[ -z "$file" ] && exit 1
zathura "$file"
