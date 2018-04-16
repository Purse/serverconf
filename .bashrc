# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'
alias ll='ls -lsah'

# Docker
alias d="docker"
alias dps="docker ps"
alias dl="docker logs -f --tail=1000"
alias dc="docker-compose"
alias dockerclean="docker rmi \$(docker images | grep '<none>' | awk '{print $3}')"
alias dockerrm="docker rm \$(docker ps -aq)"

# Search up/down
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Custom profiles
if [ -f ~/.deploy_profile ]; then
   . ~/.deploy_profile
fi
