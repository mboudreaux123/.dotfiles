#!/bin/bash

config=$HOME/.config/sway/waybar/config
style=$HOME/.config/sway/waybar/style.css

if [ "$1" = "start" ]; then
	killall waybar
	sleep .05
	waybar --config $config --style $style
elif [ "$1" = "toggle" ]; then
	kill $(pidof waybar) || waybar --config $config --style $style
fi