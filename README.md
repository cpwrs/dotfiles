### Configurations for my [nixbox](https://github.com/crpowers/nixbox) 

#### Install
```sh
git clone --bare git@github:crpowers/dotfiles.git $HOME/.dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout BRANCH_NAME
```
Note: This repository is installed BARE; the alias allows for managing dotfiles anywhere in the working tree.
