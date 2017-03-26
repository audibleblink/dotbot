# Changing/making/removing directory
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
setopt AUTO_CD

alias -g ..='..'
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'

alias md='mkdir -p'
alias d='dirs -v | head -7'

# List directory contents
alias lsa='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'
alias l='ls -lth'
alias ls='ls -FGh'

type tree &>/dev/null && alias tree='LS_COLORS="di=34:ln=35:so=32;40:ex=31" tree'

# mkdir, cd into it
mkcd () {
  mkdir -p "$1"
  cd "$1"
}
