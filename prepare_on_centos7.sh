#!/bin/bash

echo "Installing sshpass..."
yum install -y sshpass
echo "sshpass is installed."

# Add local mirror
curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
curl -o /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
yum clean all && yum makecache

# Install pip and ansible
yum install -y python-pip
 
mkdir -p ~/.pip
tee ~/.pip/pip.conf << 'EOF'
[global]
trusted-host =  mirrors.aliyun.com
index-url = https://mirrors.aliyun.com/pypi/simple
EOF
 
pip install 'ansible<2.10'

mkdir -p /etc/ansible
tee /etc/ansible/ansible.cfg << 'EOF'
[defaults]
host_key_checking=False
pipelining=True
forks=100
EOF
