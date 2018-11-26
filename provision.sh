#!/usr/bin/env bash

set -e

# Prepare environment for apt.
DEBIAN_FRONTEND=noninteractive

# Update system repository.
sudo apt-get update

# Install basic tools.
sudo apt-get install -y \
  apt-transport-https \
  build-essential \
  ca-certificates \
  curl \
  git \
  libssl-dev \
  software-properties-common \
  wget \
  zip

# Add Docker repository.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update

# Install Docker.
sudo apt-get install -y docker-ce

# Add user to docker group.
sudo usermod -aG docker ${USER}

# Install nvm.
curl -o- https://raw.githubusercontent.com/creationix/nvm/v${PROVISION_VERSIONS_NVM}/install.sh | bash
source ${HOME}/.nvm/nvm.sh

# Install Node.js.
nvm install ${PROVISION_VERSIONS_NODE}
nvm alias default ${PROVISION_VERSIONS_NODE}

# Install the wolkenkit CLI.
npm install -g wolkenkit@${PROVISION_VERSIONS_WOLKENKIT_CLI}
