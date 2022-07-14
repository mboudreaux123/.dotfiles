#!/bin/bash

WD=$(pwd)

link()
(
	ln -s $WD/* ~/.config/
)

link

