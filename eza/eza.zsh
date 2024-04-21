#!/bin/sh

if [[ -x $(which eza) ]] ; then
    echo "eza found, aliasing it as ls"
    alias ls='eza --icons=always --color=always --long --git --no-filesize --no-time --no-user --no-permissions'
    alias ll='eza --icons=always --tree --color=always --long --level 3'
fi

