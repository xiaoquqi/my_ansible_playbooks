#!/bin/bash

echo "Installing sshpass..."
yum install -y sshpass
echo "sshpass is installed."

# Install pip and ansible
yum install -y python-pip
 
mkdir -p ~/.pip
tee ~/.pip/pip.conf << 'EOF'
[global]
trusted-host =  mirrors.aliyun.com
index-url = https://mirrors.aliyun.com/pypi/simple
EOF
 
pip install ansible
