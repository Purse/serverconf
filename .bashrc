# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'
alias ll='ls -lsah'
alias vi='vim'

docker-image-inspect(){
    docker service ps -q --filter "desired-state=running" $1 | xargs -I{} docker inspect  -f '{{.NodeID}} {{.Spec.ContainerSpec.Image}}' '{}'
}
alias dimage="docker-image-inspect"

d-exec-nodes(){
    docker node list --format "{{ .Hostname }}" | xargs -I"SERVER" sh -c "echo SERVER; ssh -o StrictHostKeyChecking=no -i \"$HOME/.docker/machine/machines/SERVER/id_rsa\" docker-user@SERVER $1"
}
alias dexecnodes="d-exec-nodes"

# Docker
alias d="docker"
alias dps="docker ps"
alias dl="docker logs -f --tail=1000"
alias dkl="dl"
alias dc="docker-compose"
alias dockerclean="docker rmi \$(docker images | grep '<none>' | awk '{print $3}')"
alias dockerrm="docker rm \$(docker ps -aq)"

# Search up/down
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# add timestamps to bash history
export HISTTIMEFORMAT="%F %T "
# Increase history size
export HISTFILESIZE=5000
export HISTSIZE=5000

# ignore entries prefixed with space
export HISTCONTROL=ignorespace

# Custom profiles
if [ -f ~/.deploy_profile ]; then
   . ~/.deploy_profile
fi
