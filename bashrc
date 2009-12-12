PATH=/sbin:/usr/sbin:~/bin:$PATH
export PATH

alias ls='ls --color=always'
alias ll='ls -la'
alias h='history'
alias gvi='gvim'
alias tc='truecrypt'
alias go='gnome-open'
alias xv='xview'
alias grepsrc='grep --exclude-dir=.svn --exclude-dir=.git'
alias apt-search='apt-cache search'

alias l='ls'
alias u='cd ..'
alias uu='cd ../..'
alias uuu='cd ../../../'
alias uuuu='cd ../../../..'

alias ec2scp='scp -i ~/ops/aws/sync_test.pem'
alias ec2ssh='ssh -i ~/ops/aws/sync_test.pem'

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

HISTFILESIZE=2000
HISTSIZE=2000
export HISTFILESIZE
export HISTSIZE

. ~/.ec2_profile

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

if [ $(type -t __git_ps1) ]; then
	export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] - \w$(__git_ps1)\033[0m\]\n\$\[\033[00m\] '
else
	export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] "
fi
