<div align="center">

### dotfiles: User space configurations for a Unix-like development environment

</div>

---

Theme:
- Colors: inspired by [bluz71/vim-moonfly-colors](https://github.com/bluz71/vim-moonfly-colors)
- Font: [Berkeley Mono](https://berkeleygraphics.com/typefaces/berkeley-mono/)
## Install

Dotfiles are stored in branches specific to their OS.
```sh
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
git clone --bare git@github:crpowers/dotfiles.git $HOME/.dotfiles
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout BRANCH_NAME
```

Note: This repository is BARE; the alias allows for managing dotfiles anywhere in the working tree.

---
