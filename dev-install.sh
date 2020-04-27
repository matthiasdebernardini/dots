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

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

#vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim



