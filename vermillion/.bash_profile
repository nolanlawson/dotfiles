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

txtgray='\[\e[0;34;40m\]' 
txtcyan='\[\e[1;34;40m\]' 
txtred='\[\e[1;31;40m\]' 
txtpink='\[\e[1;35;40m\]' 
txtend='\[\e[00m\]'
export PS1="${txtgray}\W${txtend} ${txtcyan}\$(__parse_git_branch)\$(__git_is_dirty)${txtend}${txtpink}\$(__kirby_dance)${txtend} ${txtgray}\$${txtend} "

export PATH=$PATH:/home/nolan/apps/hub-linux-amd64-2.3.0-pre8/bin

alias print-colors='for x in 0 1 4 5 7 8; do for i in `seq 30 37`; do for a in `seq 40 47`; do echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "; done; echo; done; done; echo "";'
