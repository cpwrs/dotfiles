# Login shell configuration

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin
ENV=$HOME/.kshrc
EDITOR=nvim

[ -r ~/.kshrc ] && . ~/.kshrc

export PATH HOME TERM ENV EDITOR
