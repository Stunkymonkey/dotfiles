#!/bin/bash
## 0 * * * * cd ~/.dotfiles/cron/ && bash webcam.sh
now=$(date +"%Y_%m_%d_%H_%M_%S")
path="$HOME/Pictures/hour-pics/"
size="1280x720"

mkdir -p $path
streamer -q -f jpeg -s $size -o $path$now.jpeg -r 1
grey="$(python3 $(dirname $(readlink -f $0))/blackcheck.py -i $path$now.jpeg -d 10)"
# echo $grey
if [ "$grey" = "True" ] ; then
	# echo "Has to move"
	mv $path$now.jpeg ${path}black/$now.jpeg
fi
exit 0
