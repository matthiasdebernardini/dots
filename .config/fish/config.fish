set fish_greeting ""

fish_vi_key_bindings
set -x EDITOR "nvim"

set PATH $HOME/gits/llvm-project/build/bin $PATH
set LD_LIBRARY_PATH $HOME/gits/llvm-project/build/lib $LD_LIBRARY_PATH

set PATH $HOME/.cargo/bin $PATH

set -x LANG en_US.UTF-8

function inst
    sudo apt update
    sudo apt install $argv
end

function take
  mkdir -p $argv; 
  cd $argv
end


