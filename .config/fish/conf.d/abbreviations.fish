abbr gabb     'bat ~/.config/fish/conf.d/abbreviations.fish | rg abbr | fzf'
abbr apti     'doas apt install -y'
abbr aptg     'doas apt update && doas apt -y upgrade'
abbr ls       'exa -al --color=always --group-directories-first --git -s=old'
abbr la       'exa -a  --color=always --group-directories-first --git -s=old --header --long'  # all files and dirs
abbr ll       'exa -l  --color=always --group-directories-first --git -s=old'  # long format
abbr lt       'exa -aT --color=always --group-directories-first --git -s=old' # tree listing
abbr bandw    'doas bandwhich'
abbr dots     '/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME'
abbr dall     '/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME add           \
                                      $HOME/.config/fish/conf.d/abbreviations.fish \
                                      $HOME/.config/fish/config.fish               \
                                      $HOME/.config/nvim/init.vim                  \
                                      $HOME/.tmux.conf                             \
                                      $HOME/.config/alacritty/alacritty.yml        \
                                      $HOME/.config/fish/conf.d/tmux.fish          \
                                      $HOME/README.md                              \
                                      $HOME/install.sh'
abbr dcomm    '/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME commit'
abbr dpull    '/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME pull origin master'
abbr dpush    '/usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME push origin master'
abbr rb1      'RUST_BACKTRACE=1'
abbr s        'sudo'
abbr v        'nvim'
abbr c        'bat'
abbr be       'bat .env'
abbr pm       'python3 main.py'
abbr vj       'nvim justfile'
abbr g        'git'
abbr j        'just'
abbr js       'just serve'
abbr jb       'just benchmark'
abbr gc       'git checkout'
abbr om       'origin master'
abbr cr       'cargo run'
abbr frc      'nvim ~/.config/fish/config.fish'
abbr vrc      'nvim ~/.config/nvim/init.vim'
abbr bvrc     'bat ~/.config/nvim/init.vim'
abbr trc      'nvim ~/.tmux.conf'
abbr arc      'nvim ~/.config/fish/conf.d/abbreviations.fish'
abbr reload   'source ~/.config/fish/config.fish'
abbr cwd      "pwd | eval $CLIPBOARD"
abbr rmrf     "rm -rf"   # as if bricking your machine wasn't easy enough
abbr rmrfp    "rm -rfp"  # you could say that again
abbr mkdirp   'mkdir -p' # auto nesting
abbr cpr      'cp -R'    # recursive
abbr duh      'du -h'    # list disk usage for all files in ./
abbr dush     'du -sh'   # list total disk usage of ./
abbr chx      'chmod +x' # make it executable
abbr chR      'chmod -R' # recursive
abbr h        'history'
abbr x        'exit'
abbr p        'pwd'
abbr tgz      'tar -xvzf' # extract .tar.gz
abbr tbz      'tar -xvjf' # extract .tar.bz2
abbr zzz      'sudo shutdown now'
abbr reboot   'sudo shutdown -r now'
abbr off      'sudo shutdown -h now'
abbr localip  "ipconfig getifaddr en1"
abbr ips      "ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ and print $1'"
abbr myip     "curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+'"
abbr sniff    "doas ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
abbr httpdump "doas tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
abbr bi       'brew install'
abbr bs       'brew search'
abbr bud      'brew update'
abbr bug      'brew upgrade'
abbr bd       'brew doctor'
abbr bl       'brew list'
abbr bci      'brew cask install'
abbr bcs      'brew cask search'
abbr bcia     'brew cask install --appdir "/Applications"'
abbr getapp   'brew cask install --appdir "/Applications"'
abbr vag      'vagrant'
abbr vagba    'vagrant box add'
abbr vagi     'vagrant init'
abbr vagu     'vagrant up'
abbr vags     'vagrant ssh'
abbr vagus    'vagrant up; and vagrant ssh'
abbr vagh     'vagrant halt'
abbr vagr     'vagrant reload'
abbr vagd     'vagrant destroy'
abbr rclient '~/gits/anp-netstack/bin/anp_client 10.0.0.4'
abbr rserv   '~/gits/anp-netstack/bin/anp_server 10.0.0.5'
abbr cheat   'curl cheat.sh'
