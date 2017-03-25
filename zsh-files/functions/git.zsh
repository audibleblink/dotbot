alias fml='e -O $( git diff --name-only | uniq )' # Open all merge conflicts
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gpo="git push origin"
alias gcm='git commit -m'
alias gt='git tag'
alias gst='git status'
alias ga='git add'
alias gcam='git commit -am'
alias gr='git remote'
alias gb='git branch'
alias gco='git checkout'
alias gc='git commit'

# clone a repo and cd into it
function gcln () {
  url=$1
  reponame=$(echo $url | awk -F/ '{print $NF}' | sed -e 's/.git$//')
  git clone $url $reponame
  cd $reponame
}

function gd() {
  if type diff-so-fancy >/dev/null; then
    git diff --color "$@" | diff-so-fancy | less
  else
    git diff "$@"
  fi
}

