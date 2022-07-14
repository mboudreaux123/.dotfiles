#!/bin/bash

notifBins=("swaync" "mako")

killall swaync
killall mako
killall dunst

for i in ${notifBins[*]}
do
    if command -v "$i" &> /dev/null
    then
        eval $1
        exit
    fi
done