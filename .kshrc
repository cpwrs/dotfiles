# Korn Shell configuration

HISTSIZE=5000

# Bind arrow keys for navigation.
set -o emacs
alias __A="echo "\020""
alias __B="echo "\016""
alias __C="echo "\006""
alias __D="echo "\002""
alias __H="echo "\001""
alias __Y="echo "\005""

# Volume controls
alias sk="sndioctl output.level=+0.1"
alias sj="sndioctl output.level=-0.1"
alias sm="sndioctl output.mute=!"

alias ll="ls -lS"
alias temp="print $(sysctl hw.sensors.cpu0.temp0) | cut -d = -f2"
# Manage bare dotfiles repository from anywhere in the tree.
# Ex: $ dotfiles status
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# Return git branch of working directory.
git_branch () {
  git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/  \1/"
}

# Return working directory with "$HOME" shortened to "~".
short_pwd () {
  pwd | sed "s,^$HOME,~,"
}

# Set interactive shell primary prompt.
dir='\[$(tput bold)\]\[\e[38;2;54;198;146m\]\[$(short_pwd)\]\[\e[0m\]'
branch='\[\e[38;2;240;148;121m\]\[$(git_branch)\]\[\e[0m\]'
prompt=' $ '

PS1=${dir}${branch}${prompt}
