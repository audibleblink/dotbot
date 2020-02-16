# Setup fzf
# ---------
if [[ ! "$PATH" == */home/red/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/red/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/red/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/red/.fzf/shell/key-bindings.zsh"
