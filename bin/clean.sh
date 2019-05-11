#!/bin/sh

case "$1" in
	all)
		$0 docker
		$0 pacman
		$0 yay
		;;
	docker)
		docker container prune --force
		docker image prune --force
		;;
	pacman)
		pacman -Sc --noconfirm
		;;
	yay)
	    yay -Sacc --noconfirm
        ;;
	*)
		echo "Please give parameter of: [all docker pacman]"
		;;
esac
