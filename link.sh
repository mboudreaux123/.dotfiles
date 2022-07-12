#!/bin/bash


link()
(
    cd "$1"
    for i in ./*; do
        if [ -d "$i" ]; then
            echo "Dir: $i"
            link "$i"
        elif [ -f "$i" ]; then
            echo "File: $1/$i"
        fi
    done
)

link