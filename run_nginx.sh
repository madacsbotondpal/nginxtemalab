#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'

echo "${RED}Downloading and running an nginx container.${NC}"
sudo docker run -d -p 80:80 -p 443:443 madacsbotondpal/nginx:latest


echo "${RED}Writing out the content of the page.${NC}"
curl localhost:80

echo "${RED}It is sad that we cannot see the cute cat.${NC}"

