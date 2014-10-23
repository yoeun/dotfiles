# Bash settings

export PATH=$PATH:$HOME/bin:
export EDITOR='subl -w'

# system
alias ll='ls -l'
 
# git shortcuts
alias ga='git add '
alias gd='git diff'
alias gb="git branch" 
alias gbc="git branch-create" 
alias gbd="git branch-delete" 
alias gs="git status -s" 
alias gss="git stash save" 
alias gsl="git stash list" 
alias gsa="git stash apply" 
alias gsp="git stash pop" 
alias gd="git diff" 
alias gco="git checkout" 
alias go='git checkout '
alias gc='git commit'
alias gci="git commit -a" 
alias gm="git merge --no-ff" 
alias gmnc="git merge --no-ff --no-commit" 
alias gpl="git pull --rebase" 
alias cdr="cd ./\$(git rev-parse --show-cdup)"
alias gk='gitk --all&'
alias gx='gitx --all'
alias gl='git log --graph --date-order --date=relative --pretty=format:"%C(cyan)%h: %C(yellow) - %an - %Cgreen %C(cyan)%ar:%Creset%n%s%n" --color'
alias gls='gl --stat'

# hg shortcuts
alias hgs="hg status"
alias hgl="hg glog"
alias hgd="hg diff"
alias hgpl="hg pull"
alias hgo="hg up"
alias hgb="hg branch"
alias hgbs="hg branches"
alias hgbo="hg bopen"
alias hgc="hg commit"
alias hgsync="hg brebase default"
alias hgrc="hg rebase --continue"
 
# terminal colors
export CLICOLOR=1
export LS_OPTIONS='--color=auto'
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
export GREP_OPTIONS='--color=auto'
 
# define colors
WHITE="\[\033[0m\]"
MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[34m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[0;32m\]"

# git prompt
if [ ! -f /usr/local/opt/git/etc/bash_completion.d/git-prompt.sh ]; then
  function __git_ps1 () {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
  }
else
  GIT_PS1_SHOWDIRTYSTATE=true
  source /usr/local/opt/git/etc/bash_completion.d/git-completion.bash
  source /usr/local/opt/git/etc/bash_completion.d/git-prompt.sh
fi

# hg prompt
function parse_hg_dirty {
  [[ $( hg status 2> /dev/null ) != "" ]] && echo " *"
}
 
function parse_hg_branch {
  hg branch 2> /dev/null | sed -e "s/\(.*\)/ (hg: \1$(parse_hg_dirty))/"
}
 
# custom prompt: user@machine (git|hg: branch) /current/working/directory
export PS1=$GREEN"\n\u@\h"''$YELLOW'$(parse_hg_branch)$(
  # a file has been modified but not added
  if [[ $(__git_ps1) =~ \*\)$ ]]
  then echo "'$YELLOW'"$(__git_ps1 " (git: %s)")
 
  # a file has been added, but not commited
  elif [[ $(__git_ps1) =~ \+\)$ ]]
  then echo "'$MAGENTA'"$(__git_ps1 " (git: %s)")
 
  # the state is clean, changes are commited
  else echo "'$CYAN'"$(__git_ps1 " (git: %s)")
  fi)'$LIGHT_GRAY" \w"$WHITE"\n$ "
