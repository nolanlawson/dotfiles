#
# Making sure I don't shoot myself in the foot
#
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

export EDITOR=`which vi`

function __parse_git_branch {
  sed 's/ref: refs\/heads\///' 2>/dev/null <.git/HEAD | sed 's/.*/& /'
}

function __git_is_dirty {
  if [ "$(git status --porcelain 2>/dev/null)" != "" ]; then echo '* '; fi
}


__kirbies=("<('o'<)" "(>‘o’)>" "v(‘.’)v" "<('.')>" "<('.'<)" "^('.')^" "(>‘.’)>" "v(‘.’)v" "<('.')>")

function __kirby_dance {
  echo ${__kirbies[$RANDOM % 9]}
}

txtgray='\[\e[1;30m\]' 
txtcyan='\[\e[0;96m\]' 
txtred='\[\e[0;91m\]' 
txtpink='\[\e[1;31m\]' 
txtend='\[\e[00m\]'
export PS1="${txtgray}\W${txtend} ${txtcyan}\$(__parse_git_branch)\$(__git_is_dirty)${txtend}${txtpink}\$(__kirby_dance)${txtend} ${txtgray}\$${txtend} "

export NVM_DIR=/home/nolan/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
