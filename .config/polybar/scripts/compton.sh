#!/bin/sh

# https://github.com/jaagr/polybar/wiki/User-contributed-modules

#The icon that would change color
icon=""

if pgrep -x "compton" > /dev/null
then
	echo "$icon Comp" #Green
else
	echo "$icon -Comp-" #Gray
fi
