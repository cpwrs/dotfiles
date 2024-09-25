# -- Bourne Again Shell Configuration --
set -o vi

# Environment
export HISTSIZE=5000
export EDITOR=nvim

# Aliases
unalias ls
alias l="ls -la"

# Git
alias ga="git add -u"
alias gs="git status"
alias gp="git push"
alias gc="git clone"
alias gcm="git checkout master"

# Manage bare dotfiles repository from anywhere in the tree.
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# -- Prompt Configuration --

RESET="\x01\e[0m\x02" 
LIME="\x01\e[38;2;211;255;219m\x02"
BRIGHT="\x01\e[38;2;255;255;255m\x02"
OFFWHITE="\x01\e[38;2;173;171;171m\x02"
GREEN="\x01\e[38;2;137;255;203m\x02"
RED="\x01\e[38;2;255;67;83m\x02"

# Return git branch of working directory.
git_branch () {
  branch="$(git symbolic-ref HEAD 2>/dev/null)" || branch="" # Grab branch if any.
  if ! [ -z "$branch" ]; then # If branch exists ..
    branch="$OFFWHITE on $LIME${branch##refs/heads/}$OFFWHITE$RESET" # Add color, format.
  fi
  echo -e "$branch"
}

# Return working directory with "$HOME" shortened to "~".
short_pwd () {
  pwd="$(pwd | sed "s,^$HOME,~,")" # Grab pwd.
  pwd="$BRIGHT$(tput bold)${pwd}$RESET" # Add bright color and bold.
  echo -e "$pwd"
}

# Return the prompt symbol "$", in red or green depending on exit code of last command
success () {
  if [ "$exit_code" = 0 ]; then 
    sym="$GREEN* $RESET"; 
  else 
    sym="$RED* $RESET";
  fi
  echo -e "$sym"
}

# Assemble final interactive shell primary prompt.
# Must set exit_code global, which is used by prompt symbol
PROMPT_COMMAND='
  exit_code=$?
  PS1=""
  PS1+="$(success)"
  PS1+="$(short_pwd)"
  PS1+="$(git_branch)"
  PS1+=" $ "
'

# Hook direnv into bash
eval "$(direnv hook bash)"
