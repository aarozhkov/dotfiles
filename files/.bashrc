#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color'
alias egrep='egrep --color'
alias ll='ls -al --color=auto --group-directories-first -t'

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
PS1="\[\e[32m\]\u\[\e[m\]\[\e[34m\][\h]\[\e[m\]:\w $ "
source /usr/bin/virtualenvwrapper.sh
