#!/bin/bash
## 0 * * * * ~/.dotfiles/cron/webcam.sh
now=$(date +"%Y_%m_%d_%H_%M_%S")
path="$HOME/Pictures/hour-pics"
size="1280x720"
basename=$(dirname $(readlink -f $0))

mkdir -p $path
streamer -q -f jpeg -s $size -o $path/$now.jpeg -r 1
grey="$(python3 $basename/blackcheck.py -i $path/$now.jpeg -d 10)"
if [ "$grey" = "True" ] ; then
	mv $path/$now.jpeg $path/black/$now.jpeg
fi
exit 0
