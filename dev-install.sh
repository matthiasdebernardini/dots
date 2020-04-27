#!bin/sh 

echo "Starting install script for dev tools"

# determine OS
case "$OSTYPE" in
  darwin*)  echo "OSX" ;; 
  linux*)   echo "LINUX" ;;
  *)        echo "unknown: $OSTYPE" ;;
esac

# zsh
sudo apt update
sudo apt upgrade
sudo apt install zsh neovim lib-ssldev clang clang9 llvm 

# fzf

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh



