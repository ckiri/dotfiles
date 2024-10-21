#!/bin/sh
#
# Open PDFs using zathura-pdf-poppler

file=$(find ~/Documents -name "*.pdf" | wmenu -l 20) 
zathura $file
