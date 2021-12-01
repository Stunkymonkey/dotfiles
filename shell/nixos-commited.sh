#!/bin/sh

case "$-" in
	*i*)
		# This shell is interactive, if not ignore this part
		# If printing this in non-interactive shells, it'll may prevent scp to work
		if [ -z "${IN_NIX_SHELL}" ]; then
			if [ -d "/etc/nixos" ]; then
				changes=$(git -C /etc/nixos status --porcelain | wc -l)
				if [ "$changes" -gt 0 ]; then
					printf '\e[01;31m\n'                              >&2
					printf '######################################\n' >&2
					printf '# NixOS-config-Repo is not commited! #\n' >&2
					printf '######################################\n' >&2
					printf '\e[0m\n'                                  >&2
				fi
			fi
		fi
		;;
esac
