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
    branch=" (\e[38;2;211;255;219m${branch##refs/heads/}\e[0m)" # Add color
  fi

  echo -e "$branch"
}

# Return working directory with "$HOME" shortened to "~".
short_pwd () {
  pwd="$(pwd | sed "s,^$HOME,~,")" # Grab pwd.
  pwd="$(tput bold)\e[38;2;188;255;255m${pwd}\e[0m" # Add blue color and bold.
  echo -e "$pwd"
}

# Return the prompt symbol "$", in red or green depending on exit code of last command
PROMPT_COMMAND='
  if [ $? = 0 ]; then 
    dollar="\e[38;2;137;255;203m $\e[0m"; 
  else 
    dollar="\e[38;2;255;67;83m $\e[0m";
  fi
'

# Set interactive shell primary prompt.
PS1='\[$(short_pwd)$(git_branch)$(echo -e $dollar)\] '
