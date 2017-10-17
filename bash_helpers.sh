# my prompt
export PS1='\n\[\e[34m\][= \[\e[m\]\u@mbp \[\e[32m\]<\w> \[\e[m\]\[\e[30;43m\]$(__git_ps1)\[\e[m\]\[\e[34m\] =\[\e[m\]\[\e[34m\]]\[\e[m\]\[\e[31m\]\n\\$\[\e[m\]\[\e[31m\]>\[\e[m\] '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias docker-cleanup='docker rm -v $(docker ps -a -q -f status=exited)'
alias docker-rmi-cleanup='docker rmi $(docker images -q -f dangling=true)'

lias ll='ls -la'
alias so='source '
alias tmux='tmux '
alias tmux-new='tmux new -s '
alias ctags-cwd='ctags --languages=ruby,javascript --exclude=.git --exclude=log --recurse . `bundle show --paths`'
alias vnotes='cd ~/vnotes && vi '
alias dotfiles='cd ~/dotfiles && vi '

# FZF
alias gcob='git checkout  $(git branch  | fzf)'
alias gcobr='git checkout --track $(git branch -r | fzf)'
alias fzd='cd $(ls -d ~/Code/zendesk/*/ | fzf)'

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# VIM
if [ -n $TMUX ]; then
   alias vim="TERM=screen-256color vim"
   alias vi="TERM=screen-256color vim"
fi
