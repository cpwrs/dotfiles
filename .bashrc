# Bourne Again Shell Configuration

# Environment variables
export HISTSIZE=5000
export EDITOR=nvim

# Aliases
alias l="ls -la"
# Manage bare dotfiles repository from anywhere in the tree.
# Ex: $ dotfiles status
alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# Return git branch of working directory.
git_branch () {
  branch="$(git symbolic-ref HEAD 2>/dev/null)" || branch="" # Grab branch if any.
  if ! [ -z "$branch" ]; then # If branch exists ..
    branch=" (\x01\e[38;2;211;255;219m\x02${branch##refs/heads/}\x01\e[0m\x02)" # Add color
  fi

  echo -e "$branch"
}

# Return working directory with "$HOME" shortened to "~".
short_pwd () {
  pwd="$(pwd | sed "s,^$HOME,~,")" # Grab pwd.
  pwd="\x01$(tput bold)\e[38;2;188;255;255m\x02${pwd}\x01\e[0m\x02" # Add blue color and bold.

  echo -e "$pwd"
}

# Return the prompt symbol "$", in red or green depending on exit code of last command
prompt_sym () {
  if [ "$exit_code" = 0 ]; then 
    sym="\x01\e[38;2;137;255;203m\x02 $ \x01\e[0m\x02"; 
  else 
    sym="\x01\e[38;2;255;67;83m\x02 $ \x01\e[0m\x02";
  fi

  echo -e "$sym"
}

# Assemble final interactive shell primary prompt.
# Must set exit_code global, which is used by prompt symbol
PROMPT_COMMAND='
  exit_code=$?
  PS1=""
  PS1+="\u@\h:"
  PS1+="$(short_pwd)"
  PS1+="$(git_branch)"
  PS1+="$(prompt_sym)"
'
