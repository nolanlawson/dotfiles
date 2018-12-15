alias open='nautilus'

alias copy-head="git rev-parse --short HEAD | tr '\n' ' ' | sed 's/\s//g' | pbcopy"

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
