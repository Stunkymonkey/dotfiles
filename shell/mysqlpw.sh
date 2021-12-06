#!/bin/sh

#The function will find the given user and search for a mysql-password
#in the home-directory, which will get printed out!
#arg1: user where to find a config-file
#      if not given, it uses the current user in the $HOME and $USER-Variable

mysqlpw() {
    _mysqlpw_H=$HOME
    _mysqlpw_U=$USER

    # use different user, if arg1 given
	if [ -n "$1" ]; then

        # check if given user is even existing
	    if ! id "$1" >/dev/null 2>/dev/null; then
	        echo user "$1" not existing >&2
	        return 1
        fi

		_mysqlpw_U=$1
		_mysqlpw_H=$(grep ^"$1": /etc/passwd | cut -d ":" -f 6)

	fi;

    _mysqlpw_cnf="$_mysqlpw_H/.my.cnf"

	if [ ! -e "$_mysqlpw_cnf" ]; then
	    echo "$_mysqlpw_cnf" not existing >&2 && return 1
	fi

	if [ ! -r "$_mysqlpw_cnf" ]; then
	    echo "$_mysqlpw_cnf" not readable >&2 && return 1
	fi

    _mysqlpw_PW=$( (grep "password=" "$_mysqlpw_cnf" || echo undefined) | cut -d "=" -f 2)

	echo MySQL-Password for user "$_mysqlpw_U" is "$_mysqlpw_PW"
}
