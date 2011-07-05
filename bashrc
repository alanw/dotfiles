source ~/.git-completion.sh

export PATH=/usr/local/bin:$PATH
export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

# enables color in the terminal bash shell export
export CLICOLOR=1

# sets up the color scheme for list export
if [ "$OS" = "Darwin" ]; then
    export LSCOLORS=dxfxcxdxbxegedabagacad
    # export LSCOLORS='gxfxcxdxbxegedabagacad'
fi

#-------------------------------------------------------------
# The 'ls' family (this assumes you use a recent GNU ls)
#-------------------------------------------------------------
if [ "$OS" = "Darwin" ]; then
    alias ll="ls -G -h -l -F"
    alias ll="ls -G -h -l -A -F"
    alias ls="ls -G -h -F"
else
    alias ll="ls --color=auto -l -h -F"
    alias la="ls --color=auto -l -h -A -F"
    alias ls="ls --color=auto -h -F"
fi

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

# Find a file with pattern $1 in name and Execute $2 on it:
function fe()
{ find . -type f -iname '*'${1:-}'*' -exec ${2:-file} {} \;  ; }
