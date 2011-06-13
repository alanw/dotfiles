source ~/.git-completion.sh
#\h:\W \u\$

# export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
export PS1='\h:\W \u $(__git_ps1 " (%s)")\$ '