# enable color support of ls and also add handy aliases
#if [ "$TERM" != "dumb" ]; then
#    eval "`dircolors -b`"
#    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
#fi

# standard
alias l='ls -CF'
alias grep='grep --color=auto'

alias ack='ack-grep'
alias R='/Library/Frameworks/R.framework/Versions/3.2/Resources/R'

# deepki
alias invokator='cd /Users/jeanphilippe/src/deepki/invokator && python deepki/gitlab_admin_tool.py'
alias mr-stats='invokator mr-stats'

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
alias htpo='htop'
alias iniv='inv'

# git
alias up='if [ -d .svn/ ] ; then svn update ; else git pull ; fi'
alias st='if [ -d .svn/ ] ; then svn status ; else git st ; fi'
alias t='git topo-log -15'
alias tb='git topo-log-branch -15'
alias tbb='tb'
alias ggrep='git grep -n --color'
alias grm='git rebase master'
alias gcm='git checkout master'
alias gd='git diff'
alias prune='git remote prune origin'
alias clean_branches='prune ; git branch --merged master | grep -v master | xargs -n 1 git branch -d'

# docker
alias dps='docker ps'
alias dkill='docker kill'
#alias docker_quit_finished="docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs docker rm"

# autres
alias gettime='date +"%s"'
alias prettyjson='python -m json.tool'

# docker
alias pandoc='docker run --rm -v `pwd`:/source jagregory/pandoc'
#alias jekyll='docker run --rm --volume=$(pwd):/srv/jekyll --volume="$PWD/vendor/bundle:/usr/local/bundle" -it -p 127.0.0.1:4000:4000 jekyll/jekyll:3.8 jekyll'
#alias jekyll='docker run --rm --volume=$(pwd):/srv/jekyll --volume="$PWD/vendor/bundle:/usr/local/bundle" -it -p 127.0.0.1:4000:4000 jekyll/jekyll:4.0 jekyll'
alias jekyll='docker run --rm --volume=$(pwd):/srv/jekyll --volume="$PWD/vendor/bundle:/usr/local/bundle" -it -p 127.0.0.1:4000:4000 jekyll/jekyll:4.2.0 jekyll'
alias jekyll='docker run --rm --volume=$(pwd):/srv/jekyll --volume="$PWD/vendor/bundle:/usr/local/bundle" --volume="$PWD/vendor/gems:/usr/gem" -it -p 127.0.0.1:4000:4000 jekyll/jekyll:4.2.0 jekyll'
alias sherdoc='docker run -d -v /var/lib/docker:/var/lib/docker -v /var/run/docker.sock:/var/run/docker.sock -p 8080:8080 rancher/sherdock'
#alias hugo='docker run --rm -it -v $PWD:/src -u hugo jguyomard/hugo-builder hugo'
#alias hugo-server='docker run --rm -it -v $PWD:/src -p 1313:1313 -u hugo jguyomard/hugo-builder hugo server --bind 0.0.0.0'

alias testssl='docker run --rm -ti drwetter/testssl.sh'
