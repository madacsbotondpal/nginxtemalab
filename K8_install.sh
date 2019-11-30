#!/bin/bash

swapoff -a
apt update
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt update
apt install -y kubelet kubeadm kubectl

if [ "$HOSTNAME" = master ] && [ -b $1]; 
then
	ysctl net.bridge.bridge-nf-call-iptables=1
	kubeadm init --apiserver-advertise-address $1
	mkdir -p $HOME/.kube
	cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
	chown $(id -u):$(id -g) $HOME/.kube/config
	export kubever=$(kubectl version | base64 | tr -d '\n')
	kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$kubever"
fi
