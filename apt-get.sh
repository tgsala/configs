#!/bin/bash

sudo apt-get update

# programas utilizados com frequência
# útil para primeira instalação do sistema

sudo apt-get install --reinstall bash-completion
sudo apt-get install -y \
  fonts-inconsolata \
  net-tools \
  openssh-server openssh-client \
  libnss3-tools \
  vim \
  curl wget \
  lnav \
  git \
  keepassx

sudo apt-get autoremove
sudo apt-get autoclean
sudo apt-get clean
