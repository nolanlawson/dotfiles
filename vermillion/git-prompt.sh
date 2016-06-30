if test -f /etc/profile.d/git-sdk.sh
then
	TITLEPREFIX=SDK-${MSYSTEM#MINGW}
else
	TITLEPREFIX=$MSYSTEM
fi


function __git_is_dirty {
  git status --porcelain 2> /dev/null | tr '\n' ' ' | sed -e 's/.*/ */g'
} 

PS1='\[\033]0;$TITLEPREFIX:${PWD//[^[:ascii:]]/?}\007\]' # set window title
PS1="$PS1"''                   # new line
PS1="$PS1"'\[\033[32m\]'       # change to green
#PS1="$PS1"'\u@\h '             # user@host<space>
PS1="$PS1"'nolan@vermillion '
PS1="$PS1"'\[\033[35m\]'       # change to purple
PS1="$PS1"''          # show MSYSTEM
PS1="$PS1"'\[\033[33m\]'       # change to brownish yellow
PS1="$PS1"'\w'                 # current working directory
if test -z "$WINELOADERNOEXEC"
then
	GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
	COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
	COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
	COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
	if test -f "$COMPLETION_PATH/git-prompt.sh"
	then
		. "$COMPLETION_PATH/git-completion.bash"
		. "$COMPLETION_PATH/git-prompt.sh"
		PS1="$PS1"'\[\033[36m\]'  # change color to cyan
		PS1="$PS1"'`__git_ps1``__git_is_dirty`'   # bash function
	fi
fi
PS1="$PS1"'\[\033[0m\]'        # change color
PS1="$PS1"''                 # new line
PS1="$PS1"'\[\033[35m\]'       # change to purple
PS1="$PS1"" (>'.')> "                 # prompt: always $
PS1="$PS1"'\[\033[0m\]'        # change color

