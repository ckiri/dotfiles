#! /bin/sh

while true; do
    # Log stderror to a file 
    # redshift -l 49.0:9.2 -t 5700:3600 -b 1:0.75 -m randr -v & # Emable eyesaving mode
    # xset r rate 200 30 & # Set cursor speed
    # slstatus &
    # dunst &
    # rndwm &
    dwm 2> ~/.dwm.log
    # No error logging
    #dwm >/dev/null 2>&1
done
