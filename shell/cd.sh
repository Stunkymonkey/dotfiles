#!/bin/sh

#correct some fast tipped cds
c() {
	if [ "$1" = "d.." ]; then
		cd ..;
		pwd;
	fi
	if [ -d "$1" ]; then
		cd "$1" || exit;
		pwd;
	fi
	return 0;
}
