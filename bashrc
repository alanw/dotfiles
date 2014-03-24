source ~/.git-completion.sh

export PATH=$HOME/.nodenv/bin:$PATH

export PATH=/Library/PostgreSQL/9.2/bin:$PATH

export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/lib/pkgconfig\
:/usr/local/lib/pkgconfig:/opt/local/lib/pkgconfig

eval "$(rbenv init -)"
eval "$(nodenv init -)"

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments

export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_51.jdk/Contents/Home

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# bash completion for ssh hosts
SSH_COMPLETE=( $(cat ~/.ssh/known_hosts | cut -f 1 -d " " | sed -e s/,.*//g | uniq ) )
complete -o bashdefault -W "${SSH_COMPLETE[*]}" ssh

# horrible python path
export PYTHONPATH=.:~/spotify/supervision2:~/spotify/spotify-common\
:~/spotify/gevent-extra:~/spotify/gevsubprocess/src:~/spotify/presence\
:~/spotify/pycrypto:~/spotify/paramiko:~/spotify/logarchive:~/spotify/dns\
:~/spotify/rambo:~/spotify/boto2:~/spotify/protobuf7/python\
:~/spotify/hermes-python:~/spotify/hermes-python2:~/spotify/statistics/python\
:~/spotify/twisted-extra::~/spotify/radio:~/spotify/radio-index\
:~/spotify/gevent-zeromq:~/spotify/pubsub:~/spotify/dht-python\
:~/spotify/sparkey:~/spotify/metadata/python:~/spotify/slask\
:~/spotify/health:~/spotify/abtesting:~/spotify/health:~/spotify/log-parser\
:~/spotify/health:~/spotify/appstore:~/spotify/health:~/spotify/spotify-app-tools\
:~/spotify/jsdoc3-python:~/spotify/psycopg-extra:~/spotify/discovery\
:~/spotify/sharded-db:~/spotify/facebook:~/spotify/http:~/spotify/oauth\
:~/spotify/product:~/spotify/arrow:~/spotify/psycopg2:~/spotify/social\
:~/spotify/user2:~/spotify/project-skeleton:~/spotify/username:~/spotify/pycassa\
:~/spotify/build:~/spotify/boink/python:~/spotify/boink/deps/yapps2\
:~/spotify/user-policy:~/spotify/fitness:~/spotify/userinfo\
:~/spotify/routine:~/spotify/login-trial:~/spotify/routine:~/spotify/notifications\
:~/spotify/mercury/python

ulimit -n 10000

# enables color in the terminal bash shell export
export CLICOLOR=1

# sets up the color scheme for list export
if [ $(uname) = "Darwin" ]; then
    export LSCOLORS=dxfxcxdxbxegedabagacad
    # export LSCOLORS='gxfxcxdxbxegedabagacad'
fi

# sudo scutil --set HostName AlanMac.local

#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls)
#-------------------------------------------------------------
if [ $(uname) = "Darwin" ]; then
    alias ll="ls -G -h -l -F"
    alias ll="ls -G -h -l -A -F"
    alias ls="ls -G -h -F"
else
    alias ll="ls --color=auto -l -h -F"
    alias la="ls --color=auto -l -h -A -F"
    alias ls="ls --color=auto -h -F"
fi

alias spotify_peers="lsof -i -n -l|grep Spotify|cut -d\">\" -f2|cut -d\" \" -f1|cut -d\":\" -f1|grep [0-9]|nslookup -timeout=1 $1|grep \"name =\"|cut -d \"=\" -f2|sort|sed s/.$//"

alias tree='tree -Csu'     # nice alternative to 'recursive ls'

alias du='du -kh'       # Makes a more readable output.
alias df='df -kTh'

alias ..='cd ..'
alias ...='cd ../..'
alias cd..='cd ..'
alias cd...='cd ../..'

function extract()      # Handy Extract Program.
{
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xvjf $1     ;;
             *.tar.gz)    tar xvzf $1     ;;
             *.bz2)       bunzip2 $1      ;;
             *.rar)       unrar x $1      ;;
             *.gz)        gunzip $1       ;;
             *.tar)       tar xvf $1      ;;
             *.tbz2)      tar xvjf $1     ;;
             *.tgz)       tar xvzf $1     ;;
             *.zip)       unzip $1        ;;
             *.Z)         uncompress $1   ;;
             *.7z)        7z x $1         ;;
             *)           echo "'$1' cannot be extracted via >extract<" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'$*'*' -ls ; }

# Search for a string in all fills recursively:
function sf() { grep -ri $1 . ; }

