#!/usr/bin/env bash

if command -v direnv >/dev/null; then
  if [ -n "$BASH_VERSION" ]; then
    eval "$(direnv hook bash)"
  elif [ -n "$ZSH_VERSION" ]; then
    eval "$(direnv hook zsh)"
  fi
fi
