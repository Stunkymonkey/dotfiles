#!/bin/sh

# arch
if [ "${BASH_VERSION}" ] && [ -r /usr/share/doc/pkgfile/command-not-found.bash ]; then
	# shellcheck source=/dev/null
	. /usr/share/doc/pkgfile/command-not-found.bash
fi

if [ "${ZSH_VERSION}" ] && [ -r /usr/share/doc/pkgfile/command-not-found.zsh ]; then
	# shellcheck source=/dev/null
	. /usr/share/doc/pkgfile/command-not-found.zsh
fi

