#!/bin/sh

[ -r /usr/share/fzf/key-bindings.bash ] && . /usr/share/fzf/key-bindings.bash
[ -r /usr/share/fzf/completion.bash ] && . /usr/share/fzf/completion.bash

if command -v fzf-share >/dev/null; then
  source "$(fzf-share)/key-bindings.bash"
  source "$(fzf-share)/completion.bash"
fi
