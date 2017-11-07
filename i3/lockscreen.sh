#!/usr/bin/bash

[ -f "~/.lockvars" ] && [ -r "~/.lockvars" ] && . ~/.lockvars

LOCK_TIME=${LOCK_TIME:-3}
LOCK_NOTIFY_TIME=${LOCK_NOTIFY_TIME:-15}

if [ -n "${WAYLAND_DISPLAY}" ]; then
	LOCK_CMD="swaylock"
else
	LOCK_CMD="i3lock"
fi

PROGNAME=$(basename $0)

OUTPUT_IMAGE="/tmp/i3lock.png"

error(){
	echo -e '\e[01;31m'$*'\e[0m' >&2
}

usage(){
	#TODO
	cat >&2 <<-FIN
	Usage:
	  -f force lock
	  -l execute the locker
	  -n send notification
	  -d execute the xautolock daemon
	  -h help

	  Mind, that the options are order-sensitive. -lf != -fl && -l == -lf
		(-fl is probably the thing you want)
	FIN
	exit 1
}

checkfull(){
	[ 1 -eq "$force" ] || ~/.local/bin/checknofullscreen
}

lock(){
	scrot -z $OUTPUT_IMAGE
	convert $OUTPUT_IMAGE -resize 20% -level 0%,100%,0.9 -blur 0x2 -resize 500% $OUTPUT_IMAGE
	${LOCK_CMD} \
	  -t \
	  -i $OUTPUT_IMAGE
	rm $OUTPUT_IMAGE
}

notification(){
	notify-send \
	  -a lockscreen \
	  -c lock-warn \
	  -u critical \
	  -t 1000 \
	  -i screensaver \
	  "Locking Screen" \
	  "Will Lock Screen in 15s"
}

daemon(){
	xautolock \
	  -time $LOCK_TIME \
	  -locker "$0 -l" \
	  -nowlocker "$0 -fl" \
	  -notify $LOCK_NOTIFY_TIME \
	  -notifier "$0 -n" \
	  -noclose
}

force=0

while getopts ":hdfln" opt; do
	case $opt in
		h)
			usage
			;;
		f)
			force=1
			;;
		l)
			checkfull && lock
			;;
		n)
			checkfull && notification
			;;
		d)
			daemon
			;;
		\?)
			error "Invalid option: -args"
			usage
			;;
		:)
			error "Option -args requires an argument."
			usage
			;;
	esac
done

exit 0
