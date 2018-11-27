#! /bin/bash

. ./vars.sh

docker run -itd --name test-app -p 10022:22 -p 4567:4567 test-app-summon:ansible
docker exec -it test-app bash -c 'service ssh restart'
docker exec -it -e conjur_ip=$conjur_ip test-app bash -c 'echo "$conjur_ip conjur-master" >> /etc/hosts'
ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' test-app)
docker exec -it -e "ip=$ip" awx_task bash -c 'echo "$ip test-app" >> /etc/hosts'
docker exec -it -e conjur_ip=$conjur_ip awx_task bash -c 'echo "$conjur_ip conjur-master" >> /etc/hosts'

