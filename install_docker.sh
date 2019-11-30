#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'

echo "${RED}Installing Docker!${NC}"
echo "${RED}Deleting Docker if installed${NC}"

sudo apt-get remove docker docker-engine docker.io

echo "${RED}Downloading and installing${NC}"

sudo apt-get update 
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs)  stable"

sudo apt-get install docker-ce
echo "${RED}Verifying that Docker installed correctly${NC}"
sudo docker run hello-world

echo "${RED}If hello-world ran correctly you can see a message.${NC}"


