#! /bin/sh
# 
# Switch output profiles using kanshi with dmenu

choice=$(tofi <<< "external-only
internal-only
home-extend
home-extend-right
mirror
extend
extend-right")

[[ ! -z $choice ]] && kanshictl switch $choice
