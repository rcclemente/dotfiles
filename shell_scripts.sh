export PATH="$HOME/.yarn/bin:$PATH"
export TERM=screen-256color
export ACKRC=".ackrc"

# the fuck
eval $(thefuck --alias)

# zdi
alias zdi-all-restart='zdi services restart && zdi apps restart'

alias tmux-new='tmux new -s '
alias ctags="`brew --prefix`/bin/ctags"
alias ctags-cwd='ctags --languages=ruby,javascript --exclude=.git --exclude=log --recurse . `bundle show --paths`'
alias vnotes='cd ~/vnotes && nvim '

alias fzd='cd $(ls -d ~/code/zendesk/*/ | fzf)'
alias gshowlatesttag='git log --pretty=format:"%d" | grep "tag:" | head -n 1'

# Git
alias gcoammend='git commit --amend'
alias gcob='git checkout  $(git branch  | fzf)'
alias gcobr='git checkout --track $(git branch -r | fzf)'

function gresethard {
  git reset --hard origin/`git branch | grep \* | cut -d ' ' -f2`
}

function grebasei {
  count=$1
  if [ -z "$count" ]; then
    count=1
  fi
  git rebase -i HEAD~$count
}
