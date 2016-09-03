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

