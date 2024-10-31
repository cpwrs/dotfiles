# -- Bourne Again Shell Configuration --
set -o vi

# Environment
export HISTSIZE=5000
export EDITOR=nvim

# Aliases
unalias ls
alias l="ls -la"

# Git
alias ga="git add"
alias gs="git status"
alias gp="git push"
alias gc="git checkout"
alias gd="git diff"
alias gr="git restore"
alias grs="git restore --staged"
alias gcm="git commit -m"

# Manage bare dotfiles repository from anywhere in the tree.
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# -- Prompt Configuration --

RESET="\x01\e[0m\x02" 
BOLD="\x01\e[1m\x02"
LIME="\x01\e[38;2;211;255;219m\x02"
BRIGHT="\x01\e[38;2;255;255;255m\x02"
OFFWHITE="\x01\e[38;2;173;171;171m\x02"
GREEN="\x01\e[38;2;137;255;203m\x02"
RED="\x01\e[38;2;255;67;83m\x02"

git_branch () {
  local branch="$(git symbolic-ref --short HEAD 2>/dev/null)"
  if [ "$branch" ]; then 
    echo -e "$OFFWHITE on $LIME${branch}$OFFWHITE$RESET" 
  fi
}

short_pwd () {
  local pwd="$(pwd | sed "s,^$HOME,~,")" # Grab pwd, shorten $HOME to "~".
  echo -e "$BRIGHT$BOLD${pwd}$RESET" # Add bright color and bold.
}

# Return * in red or green depending on exit code of last command.
success () {
  local sym="$([ "$exit_code" -eq 0 ] && echo "$GREEN*" || echo "$RED*")"
  echo -e "$sym"
}

# Return indicator if in a direnv dev environment
ifdirenv () {
  if [ "$DIRENV_DIR" ]; then
    echo -e "$OFFWHITE(denv)$RESET "
  fi
}

# Assemble final interactive shell primary prompt.
# Must set exit_code global, which is used by prompt symbol
PROMPT_COMMAND='
  exit_code=$?
  PS1=""
  PS1+="$(success) "
  PS1+="$(ifdirenv)"
  PS1+="$(short_pwd)"
  PS1+="$(git_branch)"
  PS1+=" $ "
'

# Hook direnv into bash
eval "$(direnv hook bash)"
