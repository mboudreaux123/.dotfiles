#!/bin/bash

percent=12000
dec=5

for (( c=1; c<=$dec; c++ ))
do
    sleep .01
    light -U 1
done