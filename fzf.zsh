# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/alex/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/alex/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */Users/alex/.fzf/man* && -d "/Users/alex/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/Users/alex/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/alex/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/alex/.fzf/shell/key-bindings.zsh"

