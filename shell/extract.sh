#!/bin/sh

x() {
	for zipfile in "$@"; do
		_x_extractor
		if [ -f "$zipfile" ]; then
			case "$zipfile" in
				*.deb)
					_x_extractor="ar x" ;;
				*.tar.lrz)
					_x_extractor="lrztar -d" ;;
				*.lrz)
					_x_extractor="lrunzip" ;;
				*.tar.bz2)
					_x_extractor="bsdtar xjf" ;;
				*.bz2)
					_x_extractor="bunzip2" ;;
				*.tar.gz)
					_x_extractor="bsdtar xzf" ;;
				*.gz)
					_x_extractor="gunzip" ;;
				*.tar.xz)
					_x_extractor="bsdtar Jxf" ;;
				*.xz)
					_x_extractor="xz -d" ;;
				*.rar)
					_x_extractor="unrar e" ;;
				*.tar)
					_x_extractor="bsdtar xf" ;;
				*.tbz2)
					_x_extractor="bsdtar xjf" ;;
				*.tgz)
					_x_extractor="bsdtar xzf" ;;
				*.zip)
					_x_extractor="unzip" ;;
				*.Z)
					_x_extractor="uncompress" ;;
				*.7z)
					_x_extractor="7z x" ;;
				*)
					echo "Cannot extract '$zipfile': No extractor for filetype known ..." >&2
					return 1
					;;
			esac

			if ! command -v "$(echo "$_x_extractor" | awk '{print $1}')" >/dev/null 2>/dev/null; then
				echo "Cannot extract '$zipfile': Cannot find extractor '$(echo "$_x_extractor" | awk '{print $1}')'." >&2
				return 1
			fi

			echo "Extracting '$zipfile'..." >&2
			eval "$_x_extractor" "$zipfile"

		elif [ ! -e "$zipfile" ]; then
			echo "Cannot extract '$zipfile': File does not exist!"
			return 1
		else
			echo "Cannot extract '$zipfile': Not a valid file!"
			return 1
		fi
	done
}
