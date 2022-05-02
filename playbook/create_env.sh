cat ./create-env.sh 
#!/bin/bash

echo 'Get images'

docker pull pycontribs/ubuntu:latest
docker pull pycontribs/centos:8

sleep 2

echo 'Start docker container'

docker run --name ubuntu -d pycontribs/ubuntu:latest sleep 6000000
docker run --name centos8 -d pycontribs/centos:8  sleep 6000000

sleep 2 

echo 'play ansible'

ansible-playbook site.yml -i inventory/prod.yml --ask-vault-password


sleep 10 
echo 'remove containers'

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
