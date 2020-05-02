###############
# Ruby
###############
alias be='bundle exec'
alias yolo="be rake db:drop db:create db:migrate db:seed"
alias nyanspec='rspec spec --format NyanCatFormatter'
alias rubytags='ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)'
alias die='pgrep spring | xargs kill -9 &&  pgrep ruby | xargs kill -9'

function rbenv() {
  type rbenv &>/dev/null && eval "$(rbenv init --no-rehash - zsh)"
  rbenv "$@"
}


###############
# JavaScript
###############
alias asi='find . -not -iwholename "*node_modules*" -type f -name *.js | xargs fixmyjs --legacy'


###############
# Go
###############
gvm="${HOME}/.gvm/scripts/gvm"
[[ -e "${gvm}" ]] && source "${gvm}"


###############
# Python
###############
function pyenv() {
  type pyenv &>/dev/null && eval "$(pyenv init -)"
  pyenv "$@"
}
