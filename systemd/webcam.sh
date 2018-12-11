#!/bin/bash
now=$(date +"%Y_%m_%d_%H_%M_%S")
path="$HOME/Pictures/hour-pics"
size="1280x720"

mkdir -p "$path"
streamer -q -f jpeg -s $size -o "$path"/"$now".jpeg -r 1
exit $?
