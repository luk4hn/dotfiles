#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

shopt -s histappend
HISTCONTROL=ignoreboth  # don't log duplicate lines or lines starting with space
HISTSIZE=65535
HISTFILESIZE=102400

#PS1='[\u@\h \W]\$ '
PS1='\[\e[1;32m\]» \[\e[1;32m\]\u \[\e[1;30m\][at]\[\e[1;32m\] \H\[\e[1;30m\]╺─╸\[\e[1;30m\][\[\e[1;32m\]\w\[\e[1;30m\]]\[\e[0;32m\]\n\$ \[\e[0m\]'

#alias
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias pacman='sudo pacman'
alias win7='vboxmanage startvm "Win7"'
alias jnc-sync='sudo cp /etc/hosts /etc/jnpr-nc-hosts.bak'
alias mirror-stats='curl -s http://f.archlinuxvn.org/archlinux/status.json ; curl -s http://arm.f.archlinuxvn.org/status.json'
