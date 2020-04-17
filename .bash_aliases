# ~/.bash_aliases

# Custom ENV vars
export MKCERT_PATH="$HOME/app/mkcert"
export PATH="$PATH:$MKCERT_PATH"

export NODE_HOME="$HOME/app/node"
export NPM_HOME=$NODE_HOME
export PATH="$PATH:$NODE_HOME/bin"

# Custom FUNCTIONS / ALIASES
alias cd..="cd .."
alias la="ls -la"
alias countfiles="find . -type f | wc -l"
alias cpfolder="rsync -av --progress"

function ssh-keygen-ed25519 {
  local SSH_FILE=~/.ssh/$1
  ssh-keygen -o -a 255 -t ed25519 -f $SSH_FILE -C $1
  eval "$(ssh-agent -s)"
  ssh-add $SSH_FILE
}

function pubkey_enable {
  local PUBKEY=$1
  #sudo gpg --keyserver keyserver.ubuntu.com --recv-key $PUBKEY
  #sudo gpg -a --export $PUBKEY | sudo apt-key add -
  sudo apt-key adv --keyserver.ubuntu.com --recv-keys $PUBKEY
  sudo apt-get update
}

# -- DOCKER -- #

alias dki-update='docker images --format "{{.Repository}}:{{.Tag}}" | grep -v "<none>" | sort | uniq | xargs -L1 docker pull'
alias dkc-clear='docker container stop $(docker container ls -aq) && docker container rm $(docker container ls -aq)'
alias dki-clear='docker image prune'
alias dkn-clear='docker network prune'
alias dkv-clear='docker volume prune'

function dki {
  if [ -z "$1" ]
  then
    docker image ls --filter "dangling=false"
  else
    docker image $@
  fi
}

function dkc {
  if [ -z "$1" ]
  then
    docker container ls -a
  else
    docker container $@
  fi
}

function dkc-bash {
  docker exec -it $1 sh
}

function dkn {
   if [ -z "$1" ]
   then
     docker network ls
   else
     docker network $@
   fi
}

function dkv {
   if [ -z "$1" ]
   then
     docker volume ls
   else
     docker volume $@
   fi
}
