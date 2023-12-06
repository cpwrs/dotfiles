<div align="center">

### dotfiles: User space configurations for a Unix-like development environment. 

</div>

---

Environment stack:
Open BSD 7.4 -> Xenocara -> xenodm -> spectrwm -> kitty -> tmux -> ksh -> neovim

Theme:
- Colors: inspired by [bluz71/vim-moonfly-colors](https://github.com/bluz71/vim-moonfly-colors)
- Font: [Berkeley Mono](https://berkeleygraphics.com/typefaces/berkeley-mono/)
## Install

```sh
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
git clone --bare git@github:crpowers/dotfiles.git $HOME/.dotfiles
```

Note: This repository is BARE, the alias allows for managing dotfiles anywhere in the working tree.

---

*Only two remote holes in the default install, in a heck of a long time!*
