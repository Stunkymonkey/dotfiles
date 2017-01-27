#!/bin/bash
## */10 * * * * cd ~/.dotfiles/cron/ && bash borg-notify.sh

LAST=$(tail -1 ~/.borgbackup.log)

DIF=$((($(date -d "now" +%s) - $(date -d $LAST +%s)) / 86400))

if [ $DIF -ge 7 ] ; then
	export DISPLAY=:0
	for proc in $(pgrep -u $USER); do
		if grep -z DBUS_SESSION_BUS_ADDRESS /proc/$proc/environ; then
			export DBUS_SESSION_BUS_ADDRESS="$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$proc/environ | sed -e 's/DBUS_SESSION_BUS_ADDRESS=//')"
			break
		fi
	done
	notify-send -i drive-harddisk Borg-Backup "Your last backup was $DIF days ago.\nPlease make a new one."
fi
