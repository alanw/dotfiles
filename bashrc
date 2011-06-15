source ~/.git-completion.sh

export PATH=/usr/local/bin:$PATH
export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

#enables color in the terminal bash shell export
CLICOLOR=1
#sets up the color scheme for list export
LSCOLORS=gxfxcxdxbxegedabagacad

alias debian='ssh debian'