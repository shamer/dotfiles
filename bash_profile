[ -f ~/.bashrc ] && source ~/.bashrc

export PATH=/sbin:/usr/sbin:$PATH
[ -d ~/bin ] && export PATH=~/bin:$PATH

# Source alises
for p in ~/.bash/profiles/* ; do
    . $p
done
