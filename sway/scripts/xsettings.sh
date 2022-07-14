#!/bin/bash

xrdb -merge ~/.Xresources
killall xsettingsd
xsettingsd -c ~/.config/sway/xsettings