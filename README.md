# [Fish + NeoVim].dotfiles 

[taken from](https://www.atlassian.com/git/tutorials/dotfiles)

## using

  + fisher
  + vim-plug
  + fzf
  + cargo shell utilities and aliases

## five line bootstrap

`alias dots="/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME"`

`echo ".dots" >> .gitignore`

`git clone --bare https://github.com/matthiasdebernardini/.dotfiles $HOME/.dots`

`dots checkout`

`install.sh`

## or in one line

`curl https://gist.githubusercontent.com/matthiasdebernardini/969a3e2776fcc4b56aa774e792efcfe9/raw`
