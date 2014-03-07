export GRAILS_HOME=/Users/nolan/Downloads/grails-2.2.1/
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$GRAILS_HOME/bin:/usr/texbin
export EDITOR=`which vi`

eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib) 

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
function parse_git_branch { 
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /' 
}

function git_is_dirty {
  git status --porcelain 2> /dev/null | tr '\n' ' ' | sed -e 's/.*/* /g'
} 

export PS1="\h:\W \$(parse_git_branch)\$(git_is_dirty)\u$ "

#
# bash completion
#
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

#
# android devices
#
export NEXUS_ONE='HT017P803425'
export HTC_MAGIC='HT95BLV01000'
export GALAXY_NEXUS='014E058C1901F011'
export NOOK='3023830023863056'

# To make sure the history's brain isn't to small, you should increase its size. The following lines need to be added to your ~/.bashrc file. 
# It increases the history to the last 10.000 commands, erases previous duplicates and makes sure that the commands are 
# appended (and do no override) on shell exit:
export HISTSIZE=10000
export HISTCONTROL=erasedups
shopt -s histappend

alias couchdb_start='launchctl load -w /usr/local/Cellar/couchdb/1.5.0/homebrew.mxcl.couchdb.plist'
alias couchdb_stop='launchctl unload /usr/local/Cellar/couchdb/1.5.0/homebrew.mxcl.couchdb.plist'
alias couchdb_log='tail -100f /usr/local/var/log/couchdb/couch.log'

alias gimp='open -a /Applications/GIMP.app/'

alias apktool='/Users/nolan/Downloads/apktool-install-macosx-r05-ibot/apktool'
alias alh='/Users/nolan/Downloads/android-localization-helper/bin/alh.sh'
alias zopfli-png='/Users/nolan/Downloads/zopfli-png/zopfli-png.js'
alias firefox='open -a /Applications/Firefox.app/'
alias squash='git branch -D tmp; oldbranch=`parse_git_branch | sed "'"s/[()]//g"'"`; git checkout -b tmp; git checkout $oldbranch; git reset --hard origin/master; git merge --squash tmp'

source ~/gradle-tab-completion.bash
