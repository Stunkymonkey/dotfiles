#!/bin/sh

#alias definitions
alias cd..="cd .."
alias gits="git status"

alias les="less"

alias quit="exit"
alias :q="exit"
alias :qa="exit"
alias :q!="exit"
alias :qw="exit"

alias vim="vim -p"
alias vi="vim -p"

alias yt-dlp='yt-dlp -o "%(title)s.%(ext)s"'
alias yt-audio='yt-dlp -o "%(title)s.%(ext)s" --extract-audio'
alias yt-mp3='yt-dlp -o "%(title)s.%(ext)s" --extract-audio --audio-format mp3'
alias music-gain="find ~/Music -iname '*.mp3' -execdir mp3gain -q -k -p {} \+"
alias music-fix="find ~/Music -print0 | xargs -P 0 -0 nice -n 19 mp3val -f -si"

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
	[ -n "$(type sudo 2>/dev/null)" ] && [ "$USER" != 'root' ] \
		&& sudo_needed="sudo"

	${sudo_needed} iotop -p"$(pidof "$1" | sed 's/ / -p/g')"
}

if [ -n "$(type sudo 2>/dev/null)" ] && [ "$USER" != 'root' ]; then
	#create sudo aliases WITHOUT leading s
	for sudo in fwupdmgr mount umount iftop iotop fsadm lvchange lvconvert lvcreate lvdisplay lvextend lvm lvmchange lvmconf lvmconfig lvmdiskscan lvmdump lvmetad lvmsadc lvmsar lvreduce lvremove lvrename lvresize lvs lvscan pvchange pvck pvcreate pvdisplay pvmove pvremove pvresize pvs pvscan vgcfgbackup vgcfgrestore vgchange vgck vgconvert vgcreate vgdisplay vgexport vgextend vgimport vgimportclone vgmerge vgmknodes vgreduce vgremove vgrename vgs vgscan vgsplit;
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
		${sudo_needed} /usr/bin/pacman "$@"
	}
fi

alias pwedit="sudo vim -p /etc/{passwd,group,shadow,gshadow}"
alias cmdlist='find $(echo $PATH | tr ":" "\n") | awk -F / "{print \$NF}" | sort -u'
alias makepasswd='makepasswd --minchars=10 --maxchars=25 --count=10'
alias ssh-keygen-secure="ssh-keygen -o -a 64 -t ed25519"
alias shuttle='sshuttle --dns -r uberspace 0/0'
alias mosh-uberspace="mosh uberspace -p 40201"
alias sync-progress="watch -d grep -e Dirty: -e Writeback: /proc/meminfo"

alias vnc-temp='x11vnc -display :0 -nap -wait 50 -noxdamage -forever -rfbauth ~/.vnc/passwd -speeds 50,1,1'

alias notify='notify-send Terminal "Process has been finished"'

# xorg
alias screen-off-x='xset -display :0.0 dpms force off'
alias screen-update-x="xrandr --auto"

# wayland:
alias pdfpc="pdfpc --wayland-workaround"
alias screen-off-wl="swayidle timeout 1 'swaymsg \"output * dpms off\"' resume 'swaymsg \"output * dpms on\"; pkill -n swayidle'"
alias use-x11="QT_QPA_PLATFORM=xcb"

# DEBIAN:
alias sag='sudo apt-get'
alias key-renew='apt-key adv --keyserver keyserver.ubuntu.com --recv-keys'
alias key-repair-all='wget -q http://archive.getdeb.net/getdeb-archive.key -O- | sudo apt-key add - '

# ARCH:
alias pacman-update='sudo pacman -Syu'
alias aur-update='yay -Syua'

# NIX:
alias nix-list-results='ls -l /nix/var/nix/gcroots/auto/'
alias nixpkgs-build='nix-build . -A'

# DOTFILES:
alias dotfile-update-submodules='cd ~/.dotfiles/ && git submodule foreach git pull origin master'

# ESP32:
alias esp32-flash="esptool --chip esp32 -p /dev/ttyUSB? write_flash -z 0x1000"
alias esp32-mount="mpy-fuse --port /dev/ttyUSB? --baud 115200"
alias esp32-terminal="screen /dev/ttyUSB? 115200"

# TEE:
alias ttime_green="sh -c \"sleep 180 && notify-send -u critical 'The tea is ready'\" &"
alias ttime_black="sh -c \"sleep 300 && notify-send -u critical 'The tea is ready'\" &"

# IPv6 ping
for INTERFACE in /sys/class/net/*; do
	[ -e "$INTERFACE" ] || break # incase it is empty
	INTERFACE=$(basename "$INTERFACE")
	alias ping-all-$INTERFACE="ping -6 ff02::1%$INTERFACE"
	alias ping-routes-$INTERFACE="ping -6 ff02::2%$INTERFACE"
done

alias sort-by-size="du -hsc * | sort -hk1"
#END alias-definitions
