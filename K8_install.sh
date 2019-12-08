#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'

echo "${RED}Installing Kubernetes!${NC}"


swapoff -a
apt update
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt update
apt install -y kubelet kubeadm kubectl

echo "${RED}Kubernetes install completed!${NC}"
