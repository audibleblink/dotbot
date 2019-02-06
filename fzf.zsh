# Setup fzf
# ---------
if [[ ! "$PATH" == */home/alex/.fzf/bin* ]]; then
  export PATH="$PATH:/home/alex/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/alex/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/alex/.fzf/shell/key-bindings.zsh"

