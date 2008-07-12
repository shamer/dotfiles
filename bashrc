export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] "
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

alias ls='ls --color=always'
alias ll='ls -la'
alias h='history'
alias gvi='gvim'

shopt -s histappend
shopt -s checkwinsize
