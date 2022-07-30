#!/bin/bash

## Polkit (Arch Linux)
#/usr/lib/polkit-kde-authentication-agent-1
#/usr/lib/mate-polkit/polkit-mate-authentication-agent-1
#/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1

## Polkit (Fedora)
#/usr/libexec/kf5/polkit-kde-authentication-agent-1

## Kill existing agent instances
killall polkit-gnome-authentication-agent-1
killall polkit-kde-authentication-agent-1
killall polkit-mate-authentication-agent-1
killall /usr/bin/lxpolkit
killall lxpolkit

## List of possible polkit agents
polkitBins=("/usr/lib/mate-polkit/polkit-mate-authentication-agent-1" "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1" "/usr/lib/polkit-kde-authentication-agent-1" "/usr/libexec/kf5/polkit-kde-authentication-agent-1")

## Start first installed polkit agents based on order of list
for i in ${polkitBins[*]}
do
    if command -v "$i" &> /dev/null
    then
        eval $1
        exit
    fi
done
