# KORN SHELL CONFIG FILE

HISTSIZE=5000

# bind arrow key navigation
set -o emacs
alias __A=`echo "\020"`
alias __B=`echo "\016"`
alias __C=`echo "\006"`
alias __D=`echo "\002"`
alias __H=`echo "\001"`
alias __Y=`echo "\005"`

# useful aliases
alias ls='ls -AFt'
alias ll='ls -lS'
alias temp='print $(sysctl hw.sensors.cpu0.temp0) | cut -d = -f2'
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'


git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/  \1/'
}

# set primary prompt string
dir='\[$(tput bold)\]\[\e[38;2;174;129;255m\]${PWD}\[\e[0m\]'
branch='\[$(tput sitm)\]\[\e[38;2;54;198;146m\]\[$(git_branch)\]\[$(tput sgr0)\]'
prompt=' $ ' 

PS1=${dir}${branch}${prompt}
