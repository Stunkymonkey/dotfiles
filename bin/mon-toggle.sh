#!/bin/bash
intern=LVDS1
extern=VGA1

if xrandr | grep "$extern disconnected"; then
    xrandr --output "$extern" --off --output "$intern" --auto --primary
else
    xrandr --output "$intern" --auto --pos 0x150 --output "$extern" --primary --auto --pos 1600x0 --output HDMI1 --auto --output DP1 --auto
fi
