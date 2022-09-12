#!/bin/bash

timeScreenOff=$1
timeLock=$2
timeSuspend=$3

killall swayidle

#https://www.reddit.com/r/swaywm/comments/mtc11k/swaylock_trying_to_have_a_somewhat_nice_locker
#swayidle -w \
#    timeout $timeScreenOff 'swaymsg "output * dpms off"'
swayidle -w \
    timeout $timeScreenOff 'swaymsg "output * dpms off"' \
        resume 'swaymsg "output * dpms on"' \
    timeout $timeLock 'swaylock -f -c 000000' \
    timeout $timeSuspend 'systemctl suspend' \
    before-sleep 'swaylock -f -c 000000'