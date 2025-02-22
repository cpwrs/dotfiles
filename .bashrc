# -- Bourne Again Shell Configuration --
set -o vi

# Environment
export HISTSIZE=5000
export EDITOR=nvim

# Aliases
alias l="ls -la"

# Git
alias ga="git add"
alias gs="git status"
alias gP="git push"
alias gp="git pull"
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

# Set up a tmux session with the windows I like
sesh () {
  # Check that a path parameter is provided
  if [ $# -eq 1 ]; then
    path=$1
  else
    path=$(find ~/proj ~/uni -mindepth 1 -maxdepth 1 -type d | fzf)
  fi

  # Check that it exists and is a directory
  if [ ! -d "$path" ]; then
    echo "Error: Directory '$path' does not exist"
    return 1
  fi

  # Sanitize the session name
  dir=$(basename "$path" | tr '.' '-')

  if ! tmux has-session -t "$dir" 2>/dev/null; then
    tmux new-session -d -s "$dir" -c "$path"
    tmux send-keys -t "$dir:0" 'nvim' C-m # Open nvim window 0
    tmux new-window -t "$dir:1" -c "$path" # Term in window 1

    # Lazygit in window 2 if it's a repo
    if [ -d "$path/.git" ]; then
      tmux new-window -t "$dir:2" -c "$path"
      tmux send-keys -t "$dir:2" 'lazygit' C-m
    fi

    # Select window 0
    tmux select-window -t "$dir:0"
  fi

  tmux attach -t "$dir"
}

# Hook direnv into bash
eval "$(direnv hook bash)"
