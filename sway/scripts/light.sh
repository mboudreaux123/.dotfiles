#!/bin/bash

inc=5
dec=5
factor=5

if [ "$1" = "inc" ]; then
    for (( i=1; i<=$factor; i++ ))
    do
        sleep .01
        light -A $inc
    done
elif [ "$1" = "dec" ]; then
    for (( i=1; i<=$factor; i++ ))
    do
        sleep .01
        light -U $dec
    done
fi