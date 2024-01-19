# Login shell configuration

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin
ENV=$HOME/.kshrc

[ -r ~/.kshrc ] && . ~/.kshrc

export PATH HOME TERM ENV EDITOR

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
