#!/bin/bash

RED='\033[0;31m'
NC='\033[0m'

echo "${RED}Connceting Slave to Master!${NC}"

kubeadm join 10.0.2.15:6443 --token 2idbx4.jiseme399ovq8bn7 \
    --discovery-token-ca-cert-hash sha256:87935a0545e453fae8845adae80cb8add473722453d78558c9aaea61a85e6c9c 
