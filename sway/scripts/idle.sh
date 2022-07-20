#!/bin/bash

timeScreenOff=$1
timeLock=$2
timeSuspend=$3

killall swayidle

#https://www.reddit.com/r/swaywm/comments/mtc11k/swaylock_trying_to_have_a_somewhat_nice_locker
#swayidle -w \
#    timeout $timeScreenOff 'swaymsg "output * dpms off"'