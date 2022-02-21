#!/bin/sh

case "$1" in
	all)
		$0 docker
		$0 nix
		$0 pacman
		$0 yay
		;;
	docker)
		docker system prune --force 2>/dev/null
		;;
	nix)
		nix-collect-garbage --delete-old 2>/dev/null
		;;
	pacman)
		pacman -Sc --noconfirm 2>/dev/null
		;;
	yay)
		yay -Sacc --noconfirm 2>/dev/null
		;;
	*)
		echo "Please give parameter of: [all docker nix pacman yay]"
		;;
esac
