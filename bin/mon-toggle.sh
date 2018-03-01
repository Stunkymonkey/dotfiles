#!/bin/bash
intern=LVDS1
extern=VGA1

if xrandr | grep "$extern disconnected"; then
    xrandr --output "$extern" --off --output "$intern" --auto
else
    xrandr --output "$intern" --auto --pos 0x150 --output "$extern" --auto --pos 1600x0 --primary --output HDMI1 --auto --output DP1 --auto
fi
