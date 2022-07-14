#!/bin/bash

notifBins=("swaync" "mako")

for i in ${notifBins[*]}
do
    if command -v "$i" &> /dev/null
    then
        eval $1
        exit
    fi
done