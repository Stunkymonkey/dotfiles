#!/bin/sh
#alias definitions
alias chmox="chmod +x"
alias cd..="cd .."
alias gits="git status"
alias gl="git log --oneline --all --abbrev-commit --graph --decorate --color"
alias subl='subl3'
alias ddd="killall -USR1 dd"
alias sddd="sudo killall -USR1 dd"

alias killlall="killall"
alias kilall="killall"
alias kilal="killall"
alias killlal="killall"

alias les="less"

alias quit="exit"
alias :q="exit"
alias :qa="exit"
alias :q!="exit"
alias :qw="exit"

alias vim="vim -p"
alias vi="vim -p"

alias cp='cp -v'
alias mv='mv -v'

alias youtube-dl='youtube-dl -o "%(title)s.%(ext)s"'
alias yta='youtube-dl -o "%(title)s.%(ext)s" --extract-audio'
alias yt3='youtube-dl -o "%(title)s.%(ext)s" --extract-audio --audio-format mp3'
alias music-gain="find ~/Music -iname '*.mp3' -execdir mp3gain -q -k -p {} \+"
alias music-fix="find -print0 ~/Music | xargs -0 mp3val -f"

alias grep="grep --color=auto"
alias ls='ls --color=auto'

alias fuck="sudo !!"
alias fu='sudo "$BASH" -c "$(history -p !!)"'

# open any file wihtout the knowledge of what type it is
alias of="xdg-open"

# only list the IO of <processname> with iotop
# io <processname>
io(){
	local sudo_needed
	[ ! -z "$(type sudo 2>/dev/null)" -a "$USER" != 'root' ] \
		&& sudo_needed="sudo"

	${sudo_needed} iotop -p$(pidof "$1" | sed 's/ / -p/g')
}

if [ ! -z "$(type sudo 2>/dev/null)" -a "$USER" != 'root' ]; then
	#create sudo aliases WITHOUT leading s
	for sudo in mount umount iftop iotop fsadm lvchange lvconvert lvcreate lvdisplay lvextend lvm lvmchange lvmconf lvmconfig lvmdiskscan lvmdump lvmetad lvmsadc lvmsar lvreduce lvremove lvrename lvresize lvs lvscan pvchange pvck pvcreate pvdisplay pvmove pvremove pvresize pvs pvscan vgcfgbackup vgcfgrestore vgchange vgck vgconvert vgcreate vgdisplay vgexport vgextend vgimport vgimportclone vgmerge vgmknodes vgreduce vgremove vgrename vgs vgscan vgsplit;
	do
		type $sudo > /dev/null 2>&1 && alias $sudo="sudo $sudo";
	done
	unset sudo

	#create sudo aliases WITH leading s
	for sudo in ps vim chown chmod;
	do
		type $sudo > /dev/null 2>&1  && alias s$sudo="sudo $sudo";
	done
	unset sudo

	type pacman >/dev/null 2>&1 && pacman(){
		local sudo_needed
		# Check if pacman has -S, -R or -U option
		# which should indicate in most times if we need sudo
		echo "$*" | grep -- "-[SRU]" >/dev/null 2>&1 \
			&& sudo_needed="sudo"
		${sudo_needed} /usr/bin/pacman $*
	}
fi

alias mon-update="xrandr --auto"

alias pwedit="sudo vim -p /etc/{passwd,group,shadow,gshadow}"
alias cmdlist='find $(echo $PATH | tr ":" "\n") | awk -F / "{print \$NF}" | sort -u'
alias makepasswd='makepasswd --minchars=10 --maxchars=25 --count=10'
alias shuttle='sshuttle --dns -r uberspace 0/0'

alias backup='sudo borgmatic -v 1 && echo $(date +"%Y%m%d") > ~/.borgbackup.log'

alias vnc-temp='x11vnc -display :0 -nap -wait 50 -noxdamage -forever -rfbauth ~/.vnc/passwd -speeds 50,1,1'

alias notify='notify-send Terminal "Process has been finished"'
alias screen-off='xset -display :0.0 dpms force off'

# DEBIAN:
alias sag='sudo apt-get'
alias key-renew='apt-key adv --keyserver keyserver.ubuntu.com --recv-keys'
alias key-repair-all='wget -q http://archive.getdeb.net/getdeb-archive.key -O- | sudo apt-key add - '

# ARCH:
alias pacman-update='sudo pacman -Syu'
alias pacaur-update='pacaur -Syua'

# DOTFILES:
alias dotfile-update-submodules='cd ~/.dotfiles/ && git submodule foreach git pull origin master'

# TEE:
alias ttime_green="sh -c \"sleep 180 && notify-send -u critical 'The tea is ready'\" &"
alias ttime_black="sh -c \"sleep 300 && notify-send -u critical 'The tea is ready'\" &"

# set DPMS values in minutes
dpms(){
	[ -z "${1}" ] && echo "No time given!" && return 1
	local secs=`expr "60" "*" "${1}"`
	xset s off
	xset dpms "${secs}" "${secs}" "${secs}"
}

# scan your local network with nmap
#
# usage:
#  snet <nmap-args>
# example: (scan for every HP printer in the network)
#  snet -p jetdirect --open
#
# - get all non-linklocal IP addrs from ip
# - pipe the IPs through ipcalc to get the network ID
#   - this is neccessary to prevent scanning the same network twice
#   - likely to experience if connected via wifi and ethernet
# - xargs it to nmap at the end
alias snet="ip addr | \\grep -v "inet6" | \\grep inet | cut -d \" \" -f 6 | \\grep -v '127\\.0\\.[0-1]\\.[0-1]' | xargs -n 1 ipcalc | awk '/Network:/{print \$2}' | sort -u | xargs nmap"

#END alias-definitions
