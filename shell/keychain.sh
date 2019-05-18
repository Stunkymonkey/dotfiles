#!/bin/sh

# array to process, either folders or directories for recursive processing
KEYPATHS+=("$HOME/.ssh")

if command -v keychain 2>&1 >/dev/null; then
	eval \
        "$(find "${KEYPATHS[@]}" -type f -name '*.pub' 2>/dev/null \
		| sed 's/.pub$//' \
        | xargs keychain -q --nogui --agents ssh --timeout 600 --eval)"
fi
unset KEYPATHS
