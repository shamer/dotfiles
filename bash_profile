PATH=/opt/mplayer-bin/bin:~/bin:$PATH 
export PATH

HISTFILESIZE=2000
HISTSIZE=2000
export HISTFILESIZE
export HISTSIZE

if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
fi

# Bash completion file on OSX
if [ -f /opt/local/etc/bash_completion ]; then
	. /opt/local/etc/bash_completion
fi

# Bash completion on Gentoo
if [ -f /etc/profile.d/bash-completion ]; then
	. /etc/profile.d/bash-completion
fi

# git bash completion
if [ -f ~/.bash_completions/git-completion.bash ]; then
	. ~/.bash_completions/git-completion.bash
fi

# Set the window title
case $TERM in
	xterm*|rxvt*|Eterm)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
		;;
	screen)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
		;;
esac
