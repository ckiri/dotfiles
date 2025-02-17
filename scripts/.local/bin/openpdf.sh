#!/bin/sh
#
# Open PDFs using zathura-pdf-poppler

file=$(find ~/docs -name "*.pdf" | tofi) 
[ -z "$file" ] && exit 1
papers "$file"
