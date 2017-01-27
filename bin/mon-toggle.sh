#!/bin/sh
xrandr 1> /dev/null
sleep 2
xrandr --output VGA1 --auto --pos 1600x0 --output LVDS1 --auto --pos 0x150 --primary --output HDMI1 --auto --output DP1 --auto
