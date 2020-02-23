#!/bin/bash

chosen=$(echo -e "[Cancel]\nLogout\nShutdown\nReboot\nSuspend\nHibernate\nHybrid-sleep\nSuspend-then-hibernate" | wofi --dmenu --insensitive)

if [[ $chosen = "Logout" ]]; then
	swaymsg exit
	loginctl terminate-session "$(loginctl session-status | awk 'NR==1{print $1}')"
elif [[ $chosen = "Shutdown" ]]; then
	systemctl poweroff
elif [[ $chosen = "Reboot" ]]; then
	systemctl reboot
elif [[ $chosen = "Suspend" ]]; then
	systemctl suspend
elif [[ $chosen = "Hibernate" ]]; then
	systemctl hibernate
elif [[ $chosen = "Hybrid-sleep" ]]; then
	systemctl hibernate
elif [[ $chosen = "Suspend-then-hibernate" ]]; then
	systemctl suspend-then-hibernate
fi
