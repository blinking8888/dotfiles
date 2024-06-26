#!/bin/zsh

if [[ -x $(which bat) ]] ; then
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
    alias bathelp='bat --plain --language=help'

    help() {
        "$@" --help 2>&1 | bathelp
    }

    alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
    alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
else
    echo "bat is not found, skipping configuration"
fi

