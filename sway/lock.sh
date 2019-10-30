#!/bin/bash

images=()
swaylock_args=()

swaylock_args+=(-e)

for output in $(swaymsg -t get_outputs | jq -r '.[] .name'); do
	image=$(mktemp --suffix=.png)
	images+=("$image")
	swaylock_args+=(-i "$output":"$image")
	grim -o "$output" "$image"
done

printf '%s\n' "${images[@]}" | xargs -P 0 -I{} convert -resize 20% -level 0%,100%,0.9 -blur 0x2 -resize 500% {} {}

if command -v physlock 2>/dev/null; then
	physlock -l  prevent tty switching
	swaylock "${swaylock_args[@]}" -s center
	physlock -L  reenable tty switching
else
	swaylock "${swaylock_args[@]}" -s center
fi

rm "${images[@]}"
