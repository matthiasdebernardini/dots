set fish_greeting ""

set PATH $HOME/gits/llvm-project/build/bin $PATH
set LD_LIBRARY_PATH $HOME/gits/llvm-project/build/lib $LD_LIBRARY_PATH
set PATH $HOME/.cargo/bin $PATH

set LANG en_US.UTF-8

function inst
    sudo apt update
    sudo apt install $argv
end

function update
    sudo apt update
end

function upgrade
    sudo apt update
    sudo apt upgrade
end

function night
  sudo shutdown
  exit
end

function dlaudio
    youtube-dl -f bestaudio --extract-audio --audio-format mp3 $argv
end

function pyserve
    python3 -m http.server $argv --bind 127.0.0.1
end

function pyserver
    python3 -m http.server 1234 --bind 127.0.0.1
end

function mdfind
    find ~/ -type f | fzf --bind "enter:execute(xdg-open {})" -q "$argv"
end

function sr
    eval $argv > /dev/null 2>&1 &
end

alias v 'nvim'
alias ls 'exa -al --color=always --group-directories-first --git -s=old' # my preferred listing
alias la 'exa -a --color=always --group-directories-first --git -s=old --header --long'  # all files and dirs
alias ll 'exa -l --color=always --group-directories-first --git -s=old'  # long format
alias lt 'exa -aT --color=always --group-directories-first --git -s=old' # tree listing
