# Bourne Again Shell Configuration

export HISTSIZE=5000
export EDITOR=nvim

alias l="ls -la"
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
dir='\[$(tput bold)\]\[\e[38;2;115;240;173m\]\[$(short_pwd)\]\[\e[0m\]'
branch='\[\e[38;2;255;199;173m\]\[$(git_branch)\]\[\e[0m\]'
prompt=' $ '

PS1=${dir}${branch}${prompt}
