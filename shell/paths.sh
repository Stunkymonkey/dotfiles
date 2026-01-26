#!/bin/sh

# Append our default paths
appendpath () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            if [ -d "$1" ]; then
                export PATH="${PATH:+$PATH:}$1"
            fi
    esac
}

appendpath ~/.local/bin
appendpath ~/.bin

export GOPATH=$HOME/.go
export GOBIN=$HOME/.gobin
appendpath "$GOPATH"/bin
appendpath "$GOBIN"
