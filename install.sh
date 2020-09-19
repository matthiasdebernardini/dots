#!/bin/bash
set -ex

if [ "$(pwd)" != "$HOME" ]; then
  echo "Please clone this directory as $HOME/.dots."
  exit 1
fi
#   if ! command -v brew &> /dev/null; then
#     /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
#   fi
#   if [ -f "Brewfile" ]; then
#     brew bundle
#   fi
if [[ $(uname -s) == "Linux" ]]; then
  echo "Setting up your Linux environment..."
else
  echo "This OS isn't supported yet."
  exit 1
fi

cd ~
mkdir gits

# Install Core Packages
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install -y build-essential 
sudo apt install -y software-properties-common libssl-dev pkg-config
sudo apt install -y tmux fish
# Install Github CLI
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install gh
# neovim
sudo apt install -y fuse libfuse2 git python3-pip ack-grep
# ctags
sudo apt install gcc make pkg-config autoconf automake python3-docutils libseccomp-dev libjansson-dev libyaml-dev libxml2-dev
# doas
sudo apt install build-essential make bison flex libpam0g-dev

sudo apt upgrade -y
sudo apt purge --auto-remove cmake

# vagrant and virtualbox
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb http://download.virtualbox.org/virtualbox/debian bionic contrib"
sudo apt update
sudo apt install -y virtualbox-5.2 vagrant

curl -O https://releases.hashicorp.com/vagrant/2.2.6/vagrant_2.2.6_x86_64.deb
sudo apt install ./vagrant_2.2.6_x86_64.deb

# install CMake
# echo "Installing LLVM..."
# version=3.18
# build=1
# cd gits
# wget https://cmake.org/files/v$version/cmake-$version.$build.tar.gz
# tar -xzvf cmake-$version.$build.tar.gz
# cd cmake-$version.$build/
# ./bootstrap
# make -j$(nproc)
# sudo make install

# install LLVM
# echo "Installing LLVM..."
# cd ~/gits
# git clone https://github.com/llvm/llvm-project.git
# cd llvm-project
# mkdir build && cd build
# cmake -DLLVM_ENABLE_PROJECTS=clang -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=Release  ../llvm
# make -j$(nproc)

# install Rust
echo "Installing Rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
cargo install --locked bat
# cargo install ripgrep sd exa fd-find jql gitweb just du-dust
# cargo install zoxide -f
# sudo cargo install bandwhich --root /usr/local/bin/

# install Fisher plugin and plugins
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
source ~/.config/fish/functions/fisher.fish
# fisher add joseluisq/gitnow patrickf3139/fzf.fish

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

#https://github.com/razzius/fish-functions
#git clone \
#  --depth 1 \
#  --filter=combine:blob:none+tree:0 \
#  --no-checkout \
#  "file://$(pwd)/server_repo" \
#  local_repo \
#;
#cd local_repo
#git checkout master -- mydir/

# Install doas
cd ~/gits
git clone https://github.com/slicer69/doas
cd doas
make
sudo make install
sudo echo "permit nopass m as root" > /usr/local/etc/doas.conf 

# Install Go
curl -O https://storage.googleapis.com/golang/go1.12.9.linux-amd64.tar.gz
tar -xvf go1.12.9.linux-amd64.tar.gz
sudo chown -R root:root ./go
sudo mv go /usr/local

echo "All Done."
exit 0
