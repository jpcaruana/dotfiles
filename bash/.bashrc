# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
if [[ -n "$PS1" ]] ; then

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=100000
HISTTIMEFORMAT="%Y/%m/%d - %H:%M:%S "

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# afficher l'etat du git
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ [\1$(parse_git_dirty)]/"
}


exit_status='$(exit_code=$?; [ $exit_code -eq 0 ] || printf %s $exit_code " ")'
if [ -f ~/prompt-git.bash ]; then
	source ~/prompt-git.bash
fi
export PS1="\033[1;31m$exit_status\033[m$PS1"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
		alias most='most -c'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias lh='ls -lh'
alias l='ls -l'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

. ~/.bash_t2s

export LESS=-RFX
export EDITOR=vim

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
fi
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# alias
alias eclipse='/opt/eclipse/eclipse'
alias idea='/opt/idea-IU-129.713/bin/idea.sh'
alias sublime='/opt/sublime/sublime_text'

# Path
export GOROOT=/opt/go
export GOPATH=~/src/gopath
export JAVA_HOME=/opt/jdk8
export SCALA_HOME=/opt/scala
export RUST_HOME=/opt/rust
export SWIFT_HOME=/opt/swift
export SBT_HOME=/opt/sbt
export GRADLE_HOME=/opt/gradle
export GROOVY_HOME=/opt/groovy
export ECLIPSE_HOME=/opt/eclipse
export IDEA_HOME=/opt/idea
export MVN_HOME=/opt/apache-maven-3.2.2
export HADOOP_HOME=/opt/hadoop
export CASSANDRA_HOME=/opt/cassandra
export DATASTAX_DEVCENTER_HOME=/opt/devcenter

PATH=$PATH:$HOME/bin:$JAVA_HOME/bin:/opt/maven/bin/:$GOROOT/bin:$SBT_HOME/bin:$ECLIPSE_HOME/bin:/$IDEA_HOME/bin:$SCALA_HOME/bin:$RUST_HOME/bin:$MVN_HOME/bin:$GOPATH/bin:$HADOOP_HOME/bin:$CASSANDRA_HOME/bin:$DATASTAX_DEVCENTER_HOME:$GRADLE_HOME/bin:$GROOVY_HOME/bin:$SWIFT_HOME/usr/bin

# The next line updates PATH for the Google Cloud SDK.
source '/opt/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
source '/opt/google-cloud-sdk/completion.bash.inc'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
