# [Fish + NeoVim].dotfiles for Ubuntu/Debian

[This method](https://www.atlassian.com/git/tutorials/dotfiles)

 + only requires git (no symlinks or copies)
 + branches can be used to manage different OS's or instances
 + one line to bootstrapped

## using

  + fisher
  + vim-plug
  + fzf
  + rust shell utilities
  + abbr instead of alias

## five line bootstrap

`alias dots="/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME"`

`echo ".dots" >> .gitignore`

`git clone --bare https://github.com/matthiasdebernardini/.dotfiles $HOME/.dots`

`dots checkout master`

`install.sh`

## or in one line

`curl https://gist.githubusercontent.com/matthiasdebernardini/969a3e2776fcc4b56aa774e792efcfe9/raw`
