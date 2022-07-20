#!/bin/bash

bins=("swaync" "mako")
bin_args=("" "-c ~/.config/sway/subconfigs/mako")

## Kill all existing process if exist 
for i in "${bins[*]}"; do
    eval "killall $i"
done

## Start 
for i in "${!bins[@]}"; do
    if command -v "${bins[$i]}" &> /dev/null
    then
        echo "${bins[$i]}"
        eval "${bins[$i]} ${bin_args[$i]}"
        exit
    fi
done