alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gb='git branch -v'
alias gcm='git commit -m'
alias gc='git commit -v'
alias gcam='git commit -am'
alias gst='git status'
alias ga='git add'
alias gr='git remote -v'
alias gt='git tag'
alias gd='git diff'
alias gco='git checkout'
alias gpo="git push origin"
alias fml='e -O $( git diff --name-only | uniq )' # Open all merge conflicts

# clone a repo and cd into it
function gcln () {
  url=$1
  reponame=$(echo $url | awk -F/ '{print $NF}' | sed -e 's/.git$//')
  git clone $url $reponame
  cd $reponame
}
