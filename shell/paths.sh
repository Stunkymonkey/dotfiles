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

if which ruby >/dev/null 2>&1 && which gem >/dev/null 2>&1; then
    appendpath "$(ruby -r rubygems -e 'puts Gem.user_dir')"/bin
fi

# PERL cpan modules
appendpath "$HOME"/.perl/5/bin
export PERL5LIB="$HOME/.perl/5/lib/perl5:$PERL5LIB"
export PERL_LOCAL_LIB_ROOT="$HOME/.perl/5:$PERL_LOCAL_LIB_ROOT"
export PERL_MB_OPT="--install_base \"$HOME/.perl/5\""
export PERL_MM_OPT="INSTALL_BASE=$HOME/.perl/5"

export GOPATH=$HOME/.go
export GOBIN=$HOME/.gobin
appendpath "$GOPATH"/bin
appendpath "$GOBIN"
