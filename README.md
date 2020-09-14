# [alacritty + fish + tmux + neovim] 

## setup

I am [managing my dotfiles](https://www.atlassian.com/git/tutorials/dotfiles) on macOS [alacritty] to SSH into an Ubuntu shell [fish + tmux + neovim]. This setup is aimed at trying to develop C, python, JS, Go and rust code and administer linux boxes. I use Alacritty `brew cask install alacritty` because it has better colors, renders noticeably faster and is easier to configure than iTerm2 on an Apple Retina display. I was also having problems with scrollback on iTerm2 (with tmux) where I got it working like I wanted but then I changed something and was unable to find how to change it back in the settings (of which there are a million). I finally got everything working like I wanted on alacritty where I felt like I was actually in control of the (yaml) configuration.

I use Ubuntu instead of Debian because I've found it to have better out-of-the-box defaults (for building things) and becuase you can download a pubkey from Github during installation with Ubuntu Server (>=18.04). I will probably have a branch for Debian soon that accomplishes this.

TLDR: These dotfiles are not to setup a Linux desktop, but rather to setup a productive linux shell that I can SSH into on my local network.

## features

 + git only (no symlinks or sync'd copies)
 + can use branches to manage multiple instances
 + bootstraps itself with a one liner (script is small so you dont have to sell your soul)
 + Solarized colorscheme that works
 + fish abbr's for many things 

## a gist to pipe into bash

`curl https://gist.githubusercontent.com/matthiasdebernardini/969a3e2776fcc4b56aa774e792efcfe9/raw`

## projects used in these dotfiles

+ [alacritty](https://medium.com/@pezcoder/how-i-migrated-from-iterm-to-alacritty-c50a04705f95)
+ [fish](https://fishshell.com)
+ [nvim](https://www.linode.com/docs/tools-reference/tools/how-to-install-neovim-and-plugins-with-vim-plug/)
+ [fzf](https://github.com/junegunn/fzf)
+ [ripgrep](https://github.com/BurntSushi/ripgrep)
+ [sd](https://github.com/chmln/sd)
+ [exa](https://the.exa.website)
+ [fd-find](https://github.com/sharkdp/fd)
+ [jql](https://github.com/yamafaktory/jql)
+ [gitweb](https://github.com/yoannfleurydev/gitweb)
+ [just](https://github.com/casey/just)
+ [du-dust](https://github.com/bootandy/dust)
+ [zoxide](https://github.com/ajeetdsouza/zoxide)
+ [bat](https://github.com/sharkdp/bat)
+ [bandwhich](https://github.com/imsnif/bandwhich)
+ [fisher](https://github.com/jorgebucaran/fisher)
+ [gitnow](https://github.com/joseluisq/gitnow)
+ [pure](https://github.com/rafaelrinaldi/pure)
+ [fzf.fish](https://github.com/patrickf3139/fzf.fish)
+ [vim-plug](https://github.com/junegunn/vim-plug)
