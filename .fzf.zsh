# Setup fzf
# ---------
if [[ ! "$PATH" == */home/nam/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/nam/.fzf/bin"
fi

source <(fzf --zsh)
