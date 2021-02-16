#!/bin/sh

case "$-" in
	*i*)
		# This shell is interactive, if not ignore this part
		# If printing this in non-interactive shells, it'll may prevent scp to work
		if [ -d "/etc/nixos" ]; then
			changes=`git -C /etc/nixos status --porcelain | wc -l`

			if [ $changes -gt 0 ]; then
				echo -e '\e[01;31m'                            >&2
				echo -e '######################################' >&2
				echo -e '# NixOS-config-Repo is not commited! #' >&2
				echo -e '######################################' >&2
				echo -e '\e[0m'                                >&2
			fi
		fi
		;;
esac
