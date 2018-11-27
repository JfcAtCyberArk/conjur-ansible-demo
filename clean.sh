#! /bin/bash

docker stop test-app
docker rm test-app
docker rmi test-app-summon:ansible
docker exec -it awx_task bash -c 'rm ~/.ssh/known_hosts'
