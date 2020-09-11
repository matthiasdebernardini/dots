# .dotfiles

## for fish and neovim 

## using

  + fisher
  + vim-plug
  + fzf
  + cargo shell utilities and aliases

[taken from](https://www.atlassian.com/git/tutorials/dotfiles)

## four line bootstrap

`alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"`

`echo ".cfg" >> .gitignore`

`git clone --bare https://github.com/matthiasdebernardini/.dotfiles $HOME/.cfg`

`config checkout`

`install.sh`

### or in one line

`alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME" && echo ".cfg" >> .gitignore && git clone --bare https://github.com/matthiasdebernardini/.dotfiles $HOME/.cfg && config checkout && install.sh`

