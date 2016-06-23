#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### history
shopt -s histappend
export HISTCONTROL=ignoreboth  # don't log duplicate lines or lines starting with space
export HISTSIZE=65535
export HISTFILESIZE=102400

### prompt
_WHITE='\e[1;37m'
_GRAY='\e[1;30m'
_GREEN='\e[1;32m'
_RED='\e[1;31m'
_CYAN='\e[1;34m'
_YELLOW='\e[1;33m'
_ORANGE='\e[38;5;130m'
_TXTRST='\e[0m'

_parse_git_branch() {
    local b="$(git symbolic-ref HEAD 2>/dev/null)";
    if [ -n "$b" ]; then
        printf " (%s) " "${b##refs/heads/}";
    fi
}

_prompt_ps1() {
    local _cl_char="$_GRAY"
    local _cl_user="$_GREEN"
    local _cl_host="$_GREEN"
    local _cl_pwd="$_CYAN"

    [[ $(id -u) -eq 0 ]] && _cl_user="$_RED"

    case "$(uname -n)" in
        *crescent*)     _cl_host="$_GREEN" ;;
        *dev-*)         _cl_host="$_WHITE" ;;
        *)              _cl_host="$_YELLOW" ;;
    esac

    PS1="\[$_cl_char\]» \[$_cl_user\]\u \[$_cl_char\][at] \[$_cl_host\]\H \[$_cl_pwd\]\w \n\[$_ORANGE\]\$(_parse_git_branch)\[$_GREEN\]\$ \[$_TXTRST\]"
}

_prompt_ps1

### env
shopt -s autocd
eval $(keychain --eval --agents ssh -Q --quiet)
export EDITOR='vim'
unset SSH_ASKPASS
export VAGRANT_HOME='/data/VMs/vagrant-home'
export GOPATH=~/work/go
export PATH=$PATH:~/work/go/bin

#colored man page
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

workon() {
    local _path=$(readlink -e ~/work/${1}*)
    if [[ -n $2 ]] ; then
        cd ${_path}/${2}*
    else
        cd ${_path}
    fi
    local _s=$(basename $(pwd))
    tmux rename-window ${_s}
}

wanip() {
    dig +short myip.opendns.com @resolver1.opendns.com
}

## docker helper
dc.bash() {
    local _container=$1
    docker exec -ti $_container /bin/bash
}

dc.init() {
    local _name=$1
    docker run -d -ti --name $_name --hostname $_name ubuntu:14.04 /bin/bash
}

dc.ps() {
    docker ps -a
}

## alias
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias grep='grep --color=auto'
alias pacman='sudo pacman'
alias wo=workon
alias mirror-stats='curl -s http://f.archlinuxvn.org/archlinux/status.json ; curl -s http://arm.f.archlinuxvn.org/status.json'
