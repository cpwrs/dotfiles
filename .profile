# LOGIN SHELL CONFIG

# set environment variables
PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin
ENV=$HOME/.kshrc
EDITOR=nvim

# source korn shell config
[ -r ~/.kshrc ] && . ~/.kshrc

# export environment variables
export PATH HOME TERM ENV EDITOR
