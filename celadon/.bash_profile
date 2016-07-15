export GIT_SSH_COMMAND="ssh -i ~/.ssh/id_rsa"
export PATH=$PATH:/c/hub-windows-amd64-2.2.3/bin
export EDITOR=$(which vim)

alias open=explorer
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

function __parse_git_branch { 
  sed 's/ref: refs\/heads\///' 2>/dev/null <.git/HEAD | sed 's/.*/ &/'
}

function __git_is_dirty {
  if [ "$(git status --porcelain 2>/dev/null)" != "" ]; then echo ' *'; fi
}

export PS1="\[\033]0;MINGW64:/c/Users/nolawson\007\]\[\033[32m\]\[\033[35m\]\[\033[33m\]\w\[\033[36m\]\$(__parse_git_branch)\[\033[0m\]\$(__git_is_dirty)\[\033[35m\] (>'.')> \[\033[0m\]"
