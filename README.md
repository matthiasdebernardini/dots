# [alacritty + fish + tmux + neovim] 

![nord](https://i.ibb.co/brhBPL1/Screenshot-2020-09-19-at-13-42-45.png)

## setup

I am [managing my dotfiles](https://www.atlassian.com/git/tutorials/dotfiles) on macOS [alacritty] to SSH into an Ubuntu shell [fish + tmux + neovim]. This setup is aimed at trying to develop C, python, JS, Go and rust code and administer linux boxes. I use Alacritty because it is easier to configure than iTerm2, renders noticeably faster and has better colors on an Apple Retina display. I was also having problems with scrollback on iTerm2 (with tmux) where I got it working like I wanted but then I changed something and was unable to find how to change it back in the settings (of which there are a million). I finally got everything working like I wanted on alacritty where I felt like I was actually in control of the (yaml) configuration. Theres a link for how to migrate from iTerm2 to Alacritty in projects.

I use Ubuntu instead of Debian because I've found it to have better out-of-the-box defaults (for building things) and you can download a pubkey from Github during installation with Ubuntu Server (>=18.04). 

TLDR: These dotfiles are not to setup a Linux desktop, but rather to setup a productive Ubuntu shell that I can SSH into on my local (or not) network.

I will eventually add different ways

## features

 + git only (no symlinks or sync'd copies)
 + can use branches to manage multiple instances
 + bootstraps itself with a one liner (small script)
 + nord colorscheme for alacritty, neovim and the statusline
 + lots of fish abbr's, with a command to help learn them
 + well put together FZF integration in the shell and text editor
 
## gist

`curl https://gist.githubusercontent.com/matthiasdebernardini/969a3e2776fcc4b56aa774e792efcfe9/raw`
