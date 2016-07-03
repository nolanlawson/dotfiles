#
# Making sure I don't shoot myself in the foot
#
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

export HISTSIZE=10000

export EDITOR=`which vi`

function __parse_git_branch { 
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1 /' 
}
function __git_is_dirty {
  git status --porcelain 2> /dev/null | tr '\n' ' ' | sed -e 's/.*/* /g'
} 
function __kirby_dance {
  kirbies=("<('o'<)" "(>'o')>" "v('.')v" "<('.')>" "<('.'<)" "^('.')^" "(>'.')>" "v('.')v" "<('.')>")
  len=${#kirbies[*]}
  rando=$(expr $RANDOM % $len)
  echo ${kirbies[$rando]}
}

txtgray='\[\e[1;30m\]' 
txtcyan='\[\e[0;96m\]' 
txtred='\[\e[0;91m\]' 
txtpink='\[\e[1;31m\]' 
txtend='\[\e[00m\]'
export PS1="${txtgray}\W${txtend} ${txtcyan}\$(__parse_git_branch)\$(__git_is_dirty)${txtend}${txtpink}\$(__kirby_dance)${txtend} ${txtgray}\$${txtend} "

source ~/.nvm/nvm.sh
