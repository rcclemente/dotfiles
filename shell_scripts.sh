export PATH="$HOME/.yarn/bin:$PATH"
export TERM=screen-256color
export ACKRC=".ackrc"

# zdi
alias zdi-all-restart='zdi services restart && zdi apps restart'

alias tmux-new='tmux new -s '
alias ctags="`brew --prefix`/bin/ctags"
alias ctags-cwd='ctags --languages=ruby,javascript --exclude=.git --exclude=log --recurse . `bundle show --paths`'
alias vnotes='cd ~/vnotes && nvim '
alias fzd='cd $(ls -d ~/Code/*/*/ | fzf)'

# Git
alias git-showlatesttag='git log --pretty=format:"%d" | grep "tag:" | head -n 1'
alias git-commitammend='git commit --amend'
alias git-prunedry='git remote prune origin --dry-run'
alias git-prune='git remote prune origin '
alias git-resethard="git reset --hard origin/\`git branch | grep \* | cut -d ' ' -f2\`"

# Git with FZF
alias gcob='git checkout  $(git branch  | fzf)'
alias gcobr='git checkout --track $(git branch -r | fzf)'

# function gresethard {
#   git reset --hard origin/`git branch | grep \* | cut -d ' ' -f2`
# }
#
function git-rebase-i {
  count=$1
  if [ -z "$count" ]; then
    count=1
  fi
  git rebase -i HEAD~$count
}

#docker
function dockerc-rm-stopped {
  docker container rm `docker ps -aq`
}
function docker-stop-all {
  docker stop $(docker ps -a -q)
}
function docker-remove-all-containers {
  docker container prune
}

alias docker-show-fusage='docker system df'
alias docker-reclaim='docker system prune -a'

# kubernetes
alias k=kubectl
alias kls=kubectx
alias kns=kubens

# refresh shell
alias resh='source ~/.zshrc'


function kdevictedpod {
  kubectl get pods | grep Evicted | awk '{print $1}' | xargs kubectl delete pod
}
alias rake='noglob rake'

#java switch
export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_11_HOME=$(/usr/libexec/java_home -v11)

alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java11='export JAVA_HOME=$JAVA_11_HOME'
