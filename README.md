# .dotfiles
for fish and neovim 

featuring
  fisher
  vim-plug
  fzf
  cargo shell utilities and aliases

scheme taken from https://www.atlassian.com/git/tutorials/dotfiles

`alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME' && 
echo ".cfg" >> .gitignore && 
git clone --bare https://github.com/matthiasdebernardini/.dotfiles $HOME/.cfg

then run `config checkout`
