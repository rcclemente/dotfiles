# my prompt
export PS1='\n\[\e[34m\][= \[\e[m\]\u@mbp \[\e[32m\]<\w> \[\e[m\]\[\e[30;43m\]$(__git_ps1)\[\e[m\]\[\e[34m\] =\[\e[m\]\[\e[34m\]]\[\e[m\]\[\e[31m\]\n\\$\[\e[m\]\[\e[31m\]>\[\e[m\] '

# aliases
alias ll='ls -la'
alias so='source '
alias tmux='tmux '
alias tmux-new='tmux new -s '
alias ctags-cwd='ctags --languages=ruby,javascript --exclude=.git --exclude=log --recurse . `bundle show --paths`'
alias vnotes='cd ~/vnotes && nvim '
alias dotfiles='cd ~/dotfiles && vi '
# zdi
alias zdi-all-restart='zdi services restart && zdi apps restart'

# fzf
alias gcob='git checkout  $(git branch  | fzf)'
alias gcobr='git checkout --track $(git branch -r | fzf)'
alias fzd='cd $(ls -d ~/code/zendesk/*/ | fzf)'
alias git-show-latesttag='git log --pretty=format:"%d" | grep "tag:" | head -n 1'

export fzf_default_opts='--bind=ctrl-n:up,ctrl-p:down'

# git
alias gcoammend='git commit --amend'
# alias gdlm='git branch --merged master | grep -v '^[ * ]*master$' | xargs git branch -d'


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -s "$nvm_dir/bash_completion" ] && \. "$nvm_dir/bash_completion"  # this loads nvm bash_completion

if [ -n $tmux ]; then
   alias vim="term=screen-256color vim"
   alias vi="term=screen-256color vim"
fi

function rollbar-update-ip {
  sudo sh -c 'for ip in $(dig +short rollbar-eu.zendesk.com | grep -e "^(52|54)"); do route add ${ip} -netmask 255.192.0.0 -iface gpd0; done'
  sudo sh -c 'for ip in $(dig +short rollbar-us.zendesk.com | grep -e "^(52|54)"); do route add ${ip} -netmask 255.192.0.0 -iface gpd0; done'
}

function git-prune-local {
  git checkout master
  git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -d
}
