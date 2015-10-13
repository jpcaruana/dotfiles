# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

# standard
alias l='ls -CF'
alias grep='grep --color=auto'

alias ack='ack-grep'

# Pour les gros doigts
alias cd..='cd ..'
alias grpe='grep'
alias gerp='grep'
alias mroe='more'
alias iv='vi'
alias tial='tail'
alias xs='cd'
alias vf='cd'
alias ..=' cd ..'
alias current='grep current project.xml'
alias biuldr='buildr'
alias buidlr='buildr'

# git
alias up='if [ -d .svn/ ] ; then svn update ; else git pull ; fi'
alias st='if [ -d .svn/ ] ; then svn status ; else git st ; fi'
alias t='git topo-log -15'
alias tb='git topo-log-branch -15'
alias ggrep='git grep -n --color'
alias grm='git rebase master'
alias gcm='git checkout master'
alias gd='git diff'

# docker
alias dps='docker ps'
alias dkill='docker kill'

# autres
alias gettime='date +"%s"'
alias orgasme='for i in 10 20 30 50 60 80 100; do espeak -p${i} yes ; done'
