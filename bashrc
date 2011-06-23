source ~/.git-completion.sh

export EDITOR="mate -w"
export PATH=/usr/local/bin:$PATH
export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

#enables color in the terminal bash shell export
CLICOLOR=1
#sets up the color scheme for list export
LSCOLORS=gxfxcxdxbxegedabagacad
