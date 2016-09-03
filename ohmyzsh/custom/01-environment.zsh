
#DEFAULT_USER=luk4hn
HISTFILE=~/.histfile
HISTSIZE=65535
SAVEHIST=999999
HIST_STAMPS="mm/dd/yyyy"
setopt appendhistory

export VAGRANT_HOME='/data/VMs/vagrant-home'
export GOPATH=~/work/go
export PATH=$PATH:~/work/go/bin

alias wo=workon
alias mirror-stats='curl -s http://f.archlinuxvn.org/archlinux/status.json ; curl -s http://arm.f.archlinuxvn.org/status.json'
alias pacman='sudo pacman'

