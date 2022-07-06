#!/bin/bash

inc=5

for (( c=1; c<=$inc; c++ ))
do
    sleep .01
    light -A 1
done