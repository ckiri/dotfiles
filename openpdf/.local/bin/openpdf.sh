#!/bin/sh
#
# Open PDFs using zathura-pdf-poppler

file=$(find ~/docs -name "*.pdf" | wmenu -l 20) 
[ -z "$file" ] && exit 1
zathura "$file"
