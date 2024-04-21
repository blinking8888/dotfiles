#!/bin/sh

if [[ -x $(which eza) ]] ; then
    alias ls='eza --icons=always --color=always --long --git --no-filesize --no-time --no-user --no-permissions'
    alias ll='eza --icons=always --tree --color=always --long --level 3'
else
    echo "eza not found, skipping configuration"
fi

