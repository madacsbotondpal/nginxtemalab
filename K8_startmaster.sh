#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'

echo "${RED}Starting Master!${NC}"

sysctl net.bridge.bridge-nf-call-iptables=1
kubeadm init --apiserver-advertise-address $1
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config
export kubever=$(kubectl version | base64 | tr -d '\n')
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$kubever"
