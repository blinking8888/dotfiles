# Setup fzf
# ---------
if [[ ! "$PATH" == */home/s2r/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/s2r/.fzf/bin"
fi

eval "$(fzf --bash)"
