#! /bin/bash

systemctl stop firewalld
systemctl disable firewalld
yum remove docker docker-common docker-selinux docker-engine
yum install -y epel-release
yum install -y yum-utils device-mapper-persistent-data lvm2 ansible git python-devel python-pip python-docker-py vim-enhanced
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce -y
systemctl start docker
systemctl enable docker

git clone https://github.com/ansible/awx.git
cd awx/
git clone https://github.com/ansible/awx-logos.git
cd installer/
ansible-playbook -i inventory install.yml -vv
