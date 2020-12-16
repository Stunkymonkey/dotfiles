#!/bin/sh

case "$1" in
	all)
		$0 docker
		$0 nix
		$0 pacman
		$0 yay
		;;
	docker)
		docker system prune --force
		;;
  nix)
    nix-collect-garbage --delete-old
		;;
	pacman)
		pacman -Sc --noconfirm
		;;
	yay)
	  yay -Sacc --noconfirm
    ;;
	*)
		echo "Please give parameter of: [all docker nix pacman yay]"
		;;
esac
