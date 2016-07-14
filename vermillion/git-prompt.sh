if test -f /etc/profile.d/git-sdk.sh
then
	TITLEPREFIX=SDK-${MSYSTEM#MINGW}
else
	TITLEPREFIX=$MSYSTEM
fi

export PS1="\[\033]0;$TITLEPREFIX:${PWD//[^[:ascii:]]/?}\007\]\[\033[32m\] \[\033[35m\]\[\033[33m\]\w\[\033[36m\]\[\033[0m\]\[\033[35m\] (>'.')> \[\033[0m\] "
