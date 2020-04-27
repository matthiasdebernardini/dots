# .bashrc

# aliases
alias gotohadoopfromhome="cd ../../var/scratch/mdi570/hadoop-3.1.1"
alias checkhadoopstatus="../../var/scratch/mdi570/hadoop-3.1.1/bin/hdfs dfsadmin -report" 
alias hadoopCopyFromLocal="../../var/scratch/mdi570/hadoop-3.1.1/bin/hdfs dfs -copyFromLocal home/mdi570/helloDAS"
alias shortcutStartHDFS="../../var/scratch/mdi570/hadoop-3.1.1/sbin/start-dfs.sh"
alias shortcutStopHDFS="../../var/scratch/mdi570/hadoop-3.1.1/sbin/stop-dfs.sh"

alias lResNodes="preserve -long-list"
alias printResNodes="lResNodes |  grep mdi570 | grep -o node.*"

alias vf='vim $(fzf)'

# taken from distro tubes vimrc
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing

# Important paths
# /var/scratch/mdi570/hadoop-3.1.1/etc/hadoop

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
module load gcc
module load slurm 
module load prun

export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk
export HADOOP_HOME=/var/scratch/mdi570/hadoop-3.1.1
export PATH=${PATH}:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/var/scratch/mdi570/minidconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/var/scratch/mdi570/minidconda3/etc/profile.d/conda.sh" ]; then
        . "/var/scratch/mdi570/minidconda3/etc/profile.d/conda.sh"
    else
        export PATH="/var/scratch/mdi570/minidconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

source /Users/matthiasdebernardini/Library/Preferences/org.dystroy.broot/launcher/bash/br
