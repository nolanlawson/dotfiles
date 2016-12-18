export GRAILS_HOME=/Users/nolan/Downloads/grails-2.2.1/
export ANDROID_HOME=/Users/nolan/Downloads/android-sdk/sdk
export PATH=/Users/nolan/.npm-packages/bin:/usr/local/Cellar/curl/7.40.0/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$GRAILS_HOME/bin:/usr/texbin
export PATH=$PATH:/Applications/Momentics.app/host_10_3_1_12/darwin/x86/usr/bin
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export EDITOR=`which vi`

alias mou='open -a /Applications/Mou.app/'
alias audacity='open -a /Applications/Audacity/Audacity.app/'
#
# Making sure I don't shoot myself in the foot
#
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

#
# git coloration and nice command prompt
#

function __parse_git_branch {
  sed 's/ref: refs\/heads\///' 2>/dev/null <.git/HEAD | sed 's/.*/& /'
}

function __git_is_dirty {
  if [ "$(git status --porcelain 2>/dev/null)" != "" ]; then echo '* '; fi
}


__kirbies=("<('o'<)" "(>'o')>" "v('.')v" "<('.')>" "<('.'<)" "^('.')^" "(>‘.’)>" "v(‘.’)v" "<('.')>")

function __kirby_dance {
  echo ${__kirbies[$RANDOM % 9]}
}
txtgray='\[\e[1;30m\]'
txtblue='\[\e[1;94m\]'
txtred='\[\e[0;91m\]'
txtpink='\[\e[1;31m\]'
txtend='\[\e[00m\]'
export PS1="${txtgray}\W${txtend} ${txtblue}\$(__parse_git_branch)\$(__git_is_dirty)${txtend}${txtpink}\$(__kirby_dance)${txtend} ${txtgray}\$${txtend} "

#
# bash completion
#
source ~/git-completion.bash

#
# android devices
#
export NEXUS_ONE='HT017P803425'
export HTC_MAGIC='HT95BLV01000'
export GALAXY_NEXUS='014E058C1901F011'
export NOOK='3023830023863056'
export NEXUS5='04ac260f252751a3'

# To make sure the history's brain isn't to small, you should increase its size. The following lines need to be added to your ~/.bashrc file. 
# It increases the history to the last 10.000 commands, erases previous duplicates and makes sure that the commands are 
# appended (and do no override) on shell exit:
export HISTSIZE=10000
export HISTCONTROL=erasedups
shopt -s histappend

alias couch-start='launchctl load -w /usr/local/Cellar/couchdb/1.6.1_7/homebrew.mxcl.couchdb.plist'
alias couch-stop='launchctl unload /usr/local/Cellar/couchdb/1.6.1_7/homebrew.mxcl.couchdb.plist'
alias couch-log='tail -100f /usr/local/var/log/couchdb/couch.log'

alias gimp='open -a /Applications/GIMP.app/'
alias mate='open -a /Applications/TextMate.app/'

alias apktool='/Users/nolan/Downloads/apktool-install-macosx-r05-ibot/apktool'
alias alh='/Users/nolan/Downloads/android-localization-helper/bin/alh.sh'
alias firefox='open -a /Applications/Firefox.app/'
alias squash='git branch -D tmp; oldbranch=`parse_git_branch | sed "'"s/[()]//g"'"`; git checkout -b tmp; git checkout $oldbranch; git reset --hard origin/master; git merge --squash tmp'
alias copy-head='git rev-parse HEAD | pbcopy'

source ~/gradle-tab-completion.bash

source ~/.acurl
alias lolcat="logcat-color"
alias jcurl="curl -g -H 'Content-Type:application/json'"

# python virtualenv stuff
source "/usr/local/bin/virtualenvwrapper.sh"
export WORKON_HOME="/opt/virtual_env/"

function mingz () { curl -sL wzrd.in/standalone/"$1"|uglifyjs -mc 2>/dev/null|gzip -c|wc -c;}

function webmify() { ffmpeg -i "$1" -c:v libvpx -r 60 -crf 10 -b:v 1M -c:a libvorbis -an $(echo $1 | sed 's/\(.*\)\..*/\1.webm/') ;}
function mp4ify() { ffmpeg -i "$1" -r 60 -crf 10 -b:v 1M -an $(echo $1 | sed 's/\(.*\)\..*/\1.mp4/') ;}
function gif2webm() { ffmpeg -i "$1" -c:v libvpx -crf 12 -b:v 500K $(echo $1 | sed 's/\(.*\)\..*/\1.webm/') ;}

export NVM_DIR="/Users/nolan/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export STUDIO_JDK=/Library/Java/JavaVirtualMachines/jdk1.8.0_40.jdk

alias ios-log="tail -f ~/Library/Logs/CoreSimulator/*/system.log"
alias ios-clear="xcrun simctl erase all"
function copyScreenshot() { bash -c "cp ~/Dropbox/Screenshots/$(ls ~/Dropbox/Screenshots/ | grep png$ | sort -r | head -n 1 | sed 's/ /\\ /g') $1" ;}
alias nom="rm -fr node_modules/ && npm cache clean && npm install"
alias tessel=t2
