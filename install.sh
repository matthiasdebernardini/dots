#!/bin/bash
set -ex

cd ~
mkdir gits

# Install Core Packages
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install -y build-essential 
sudo apt install -y software-properties-common libssl-dev pkg-config
sudo apt install -y tmux fish
# neovim
sudo apt install -y fuse libfuse2 git python3-pip ack-grep
# ctags
sudo apt install gcc make pkg-config autoconf automake python3-docutils libseccomp-dev libjansson-dev libyaml-dev libxml2-dev

sudo apt upgrade -y
sudo apt purge --auto-remove cmake

# install CMake
echo "Installing LLVM..."
version=3.18
build=1
cd gits
wget https://cmake.org/files/v$version/cmake-$version.$build.tar.gz
tar -xzvf cmake-$version.$build.tar.gz
cd cmake-$version.$build/
./bootstrap
make -j$(nproc)
sudo make install

# install LLVM
echo "Installing LLVM..."
cd ~/gits
git clone https://github.com/llvm/llvm-project.git
cd llvm-project
mkdir build && cd build
cmake -DLLVM_ENABLE_PROJECTS=clang -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release  ../llvm
make -j$(nproc)

# install Rust
echo "Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
cargo install --locked bat
cargo install ripgrep sd exa fd-find jql gitweb just du-dust
cargo install zoxide -f
sudo cargo install bandwhich --root /usr/local/bin/

# install Fisher plugin and plugins
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
source ~/.config/fish/functions/fisher.fish
fisher add joseluisq/gitnow rafaelrinaldi/pure patrickf3139/fzf.fish

# Install NeoVim
cd ~
wget --quiet https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage --output-document nvim

chmod +x nvim
sudo chown root:root nvim
sudo mv nvim /usr/bin

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

pip3 install --user neovim

## Configuring Vim
echo "Configuring NeoVim..."
mkdir -p ~/.vim/tmp/{swap,undo,backup}

# Install FZF from source
echo "Installing FZF..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Install universal ctags
echo "Installing CTags..."
cd ~/gits
git clone https://github.com/universal-ctags/ctags
cd ctags
./autogen.sh
./configure 
make -j$(nproc)
sudo make install 

echo "All Done."
