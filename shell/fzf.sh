#!/usr/bin/env bash

# Arch
if [ "${BASH_VERSION}" ] && [ -r /usr/share/fzf/key-bindings.bash ]; then
  # shellcheck source=/dev/null
  . /usr/share/fzf/key-bindings.bash
fi
if [ "${BASH_VERSION}" ] && [ -r /usr/share/fzf/completion.bash ]; then
  # shellcheck source=/dev/null
  . /usr/share/fzf/completion.bash
fi

if [ "${ZSH_VERSION}" ] && [ -r /usr/share/fzf/key-bindings.zsh ]; then
  # shellcheck source=/dev/null
  . /usr/share/fzf/key-bindings.zsh
fi
if [ "${ZSH_VERSION}" ] && [ -r /usr/share/fzf/completion.zsh ]; then
  # shellcheck source=/dev/null
  . /usr/share/fzf/completion.zsh
fi

# NixOS
if [ "${BASH_VERSION}" ] && command -v fzf-share >/dev/null; then
  # shellcheck source=/dev/null
  . "$(fzf-share)/key-bindings.bash"
  # shellcheck source=/dev/null
  . "$(fzf-share)/completion.bash"
fi

if [ "${ZSH_VERSION}" ] && command -v fzf-share >/dev/null; then
  # shellcheck source=/dev/null
  . "$(fzf-share)/key-bindings.zsh"
  # shellcheck source=/dev/null
  . "$(fzf-share)/completion.zsh"
fi
