#!/bin/sh

notify(){
	notify-send \
		--app-name=redshift \
		--urgency=low \
		--icon=redshift \
		--hint=int:transient:1 \
		"${1}" "${2}"
}

case $1 in
	period-changed)
		notify "Gammastep" "Period changed to $3"
		;;
	*)
		notify "Gammastep" "Gammastep just fired an unknown hook with these options: '$*'. Ah, of course, this notification is just here, to troll you! :-P"
		;;
esac
