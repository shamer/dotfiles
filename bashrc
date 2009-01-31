export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] "

alias ls='ls --color=always'
alias ll='ls -la'
alias h='history'
alias gvi='gvim'
alias tc='truecrypt'

shopt -s cmdhist
shopt -s histappend
shopt -s checkwinsize

# Set the window title
case $TERM in
	xterm*|rxvt*|Eterm)
		export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
		;;
	screen)
		export PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
		;;
esac
