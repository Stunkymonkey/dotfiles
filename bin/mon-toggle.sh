#!/bin/bash
intern=LVDS1
extern=HDMI3

if xrandr | grep "$extern disconnected"; then
    xrandr --output "$extern" --off --output "$intern" --auto --primary
else
    xrandr --output "$intern" --auto --pos 0x180 --output "$extern" --primary --auto --pos 1600x0 --output VGA1 --auto --output HDMI1 --auto --output DP1 --auto
fi
