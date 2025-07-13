export PATH="$HOME/.yarn/bin:$PATH"
export TERM=screen-256color
export ACKRC=".ackrc"

# zdi
alias zdi-all-restart='zdi services restart && zdi apps restart'

# alias tmux-new='tmux new -s '
function tmux-new {
  tmux new -s $1 -n $1
  command ...
}

# ls
lof="ls -p | grep -v /"


alias ctags="`brew --prefix`/bin/ctags"
alias ctags-cwd='ctags --languages=ruby,javascript --exclude=.git --exclude=log --recurse . `bundle show --paths`'
alias vnotes='cd ~/vnotes && nvim '

# Git
alias git-add='git add -A'
alias git-difflast='git diff HEAD~1'
alias git-showlatesttag='git log --pretty=format:"%d" | grep "tag:" | head -n 1'
alias git-commitammend='git commit --amend'
alias git-prunedry='git remote prune origin --dry-run'
alias git-prune='git remote prune origin '
alias git-resethard="git reset --hard origin/\`git branch | grep \* | cut -d ' ' -f2\`"
alias git-deletemainmerged="git branch --merged main | grep -v '^[ *]*main$' | xargs git branch -D"
alias git-deletemastermerged="git branch --merged master | grep -v '^[ *]*master$' | xargs git branch -D"
alias git-deletegone="git branch -vv | grep ': gone]' | awk '{print $1}' | xargs -r git branch -d"

# DNS
alias dnsflush='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'

# Terraform
alias tf-fmt="terraform fmt --recursive"
alias tf="terraform "

# Git with FZF
alias gcob='git checkout  $(git branch  | fzf)'
alias gcobr='git checkout --track $(git branch -r | fzf)'
alias fzd='cd $(ls -d ~/Code/*/*/ | fzf)'
alias zzd='cd $(find . -type d -print | fzf)' 

# function gresethard {
#   git reset --hard origin/`git branch | grep \* | cut -d ' ' -f2`
# }
#

function git-deletegone {
  git fetch -p && for branch in $(git branch -vv | grep ': gone]' | awk '{print $1}'); do git branch -D $branch; done
}

function git-rebase-i {
  count=$1
  if [ -z "$count" ]; then
    count=1
  fi
  git rebase -i HEAD~$count
}

function dos2unix_re {
  find . -type f -print0 | xargs -0 dos2unix
}

#docker
function docker-rm-stopped {
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
alias docker-dedockify="docker run -v /var/run/docker.sock:/var/run/docker.sock --rm mrhavens/dedockify"

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
# export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
# export JAVA_11_HOME=$(/usr/libexec/java_home -v11)
#
# alias java8='export JAVA_HOME=$JAVA_8_HOME'
# alias java11='export JAVA_HOME=$JAVA_11_HOME'

alias lvi='nvim -u $HOME/dotfiles/nvim/new_init.lua'

# lazyvim
alias lzvim="NVIM_APPNAME=lazyvim nvim"

# kicknvim
alias kicknvim="NVIM_APPNAME=kicknvim nvim"

# Source local configuration if it exists
if [ -f ~/local.sh ]; then
    source ~/local.sh
fi
