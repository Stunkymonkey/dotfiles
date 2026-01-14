#!/usr/bin/env bash

if command -v fzf >/dev/null 2>&1; then
  if [ -n "${BASH_VERSION-}" ]; then
    # shellcheck source=/dev/null
    eval "$(fzf --bash)"
  elif [ -n "${ZSH_VERSION-}" ]; then
    # shellcheck source=/dev/null
    source <(fzf --zsh)
  elif [ -n "${FISH_VERSION-}" ]; then
    # shellcheck source=/dev/null
    fzf --fish | source
  fi
fi
