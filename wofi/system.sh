#!/usr/bin/env bash

chosen="$(wofi --dmenu --insensitive <<-END
[Cancel]
Logout
Poweroff
Reboot
Suspend
Hibernate
Suspend-then-hibernate
END
)"

if [[ "${chosen}" = "Logout" ]]; then
	swaymsg exit
	loginctl terminate-session "$(loginctl session-status | awk 'NR==1{print $1}')"
elif [ -z "${chosen}" ] || [[ "${chosen}" = "[Cancel]" ]]; then
	exit 0;
fi

systemctl "$(tr '[:upper:]' '[:lower:]' <<< "${chosen}")"
