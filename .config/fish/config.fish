echo '🧘 how is your posture? 🐟'

set -x EDITOR "nvim"

set -x PATH $HOME/gits/llvm-project/build/bin $PATH
set -x LD_LIBRARY_PATH $HOME/gits/llvm-project/build/lib $LD_LIBRARY_PATH

set -x PATH $HOME/.cargo/bin $PATH

set -x GOPATH $HOME/go
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin

set -x PYTHONPATH /usr/bin/python $PYTHONPATH
set -x PYTHONPATH /usr/bin/python2 $PYTHONPATH

set MYVIMRC ~/.config/nvim/init.vim

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x LANGUAGE en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

function inst
    sudo apt update
    sudo apt install $argv
end

function take
  mkdir -p $argv; 
  cd $argv
end

function cht
    curl -sL cheat.sh/$argv | bat -p
end

zoxide init fish | source

