ZSH=$HOME/.zsh
ZSH_CUSTOM=$HOME/.dotfiles/zsh-files

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
export EDITOR="$(which vim)"

plugins=(
  vi-mode
  clipboard
  docker-zsh-completion
  gpg
  zsh-autopair
  fuck
  fzf
  todo
  #must be last
  history-substring-search
  zsh-syntax-highlighting
)

source <(cat $ZSH_CUSTOM/functions/**/*.zsh)  # Sources custom functions and aliases
source $ZSH_CUSTOM/sourcer.zsh                # Sets up fpaths and plugins
source $ZSH_CUSTOM/themes/audibleblink.zsh    # Sets theme

alias e=$EDITOR
alias zedit="e ~/.zshrc"
alias vedit="e ~/.vimrc"
alias tedit="e ~/.tmux.conf"
alias bedit="e ~/.vim/plugins.vim"
alias reload="source ~/.zshrc"

# Temp aliases

# necessary when using Termite
[ "$TERM" = "xterm-termite" ] && alias ssh="TERM=screen-256color ssh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.zshrc_local ] && source ~/.zshrc_local

