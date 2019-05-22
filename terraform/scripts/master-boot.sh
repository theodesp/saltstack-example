#!/usr/bin/env bash

set -eo pipefail

export DEBIAN_FRONTEND=noninteractive
apt-get update
wget -O - https://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -

touch /etc/apt/sources.list.d/saltstack.list
echo 'deb http://repo.saltstack.com/apt/ubuntu/18.04/amd64/latest bionic main' >> /etc/apt/sources.list.d/saltstack.list
apt-get update

apt-get install -y salt-master
