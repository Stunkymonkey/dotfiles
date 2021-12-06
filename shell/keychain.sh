#!/usr/bin/env bash

# Assert an ssh-agent (which is empty at the beginning)
if command -v keychain > /dev/null 2>&1; then
	eval "$(keychain -q --nogui --agents ssh --timeout 600 --eval)"
fi

