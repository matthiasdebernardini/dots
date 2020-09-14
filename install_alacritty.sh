#!/bin/bash
# https://gist.githubusercontent.com/PezCoder/4fd0182de5aacc13a388cdd4c935338c/raw/6d8056282b83a8470adce89e22424a7f55bcde58/install-alacritty.sh

set -e

# Utility functions

## For ease of iterative experimentation
doo () {
    $@
    # echo $@
}

command_exists () {
  type "$1" &> /dev/null ;
}

installed () {
  echo -e " ✓ $1 already installed."
}

# START HERE.
main () {
    install_alacritty
}

# https://github.com/alacritty/alacritty#macos
# Alacritty helpful links:
# Setup italics: https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/
# Ligature for operator mono: https://github.com/kiliman/operator-mono-lig
install_alacritty() {
  if !(command_exists alacritty); then
    doo brew cask install alacritty

    # clone
    doo git clone https://github.com/alacritty/alacritty.git
    doo cd alacritty

    # Install terminfo globally, I'm thinking this is to make the awesome
    # true colors & italic fonts work
    # We also change default terminal to alacritty in ~/.tmux.conf to use this
    doo sudo tic -xe alacritty,alacritty-direct extra/alacritty.info

    # clean
    doo cd ..
    doo rm -rf alacritty

    # Enable smoothing on mac
    doo defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO
    doo defaults -currentHost write -globalDomain AppleFontSmoothing -int 2
  else
    installed 'alacritty'
  fi
}

# Fire missiles
main
