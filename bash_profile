PATH=/opt/mplayer-bin/bin:~/bin:$PATH 
export PATH

HISTFILESIZE=2000
HISTSIZE=2000
export HISTFILESIZE
export HISTSIZE

if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
fi
