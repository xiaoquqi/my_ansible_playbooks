#!/bin/bash

# Get the current Ubuntu version codename
UBUNTU_CODENAME=$(lsb_release -cs)

# Backup the original APT sources list
echo "Backing up the original APT sources list..."
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak

# Replace APT sources with Tsinghua University mirrors
echo "Replacing APT sources with Tsinghua University mirrors..."
sudo tee /etc/apt/sources.list << EOF
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $UBUNTU_CODENAME main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $UBUNTU_CODENAME-security main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $UBUNTU_CODENAME-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $UBUNTU_CODENAME-proposed main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $UBUNTU_CODENAME-backports main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $UBUNTU_CODENAME main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $UBUNTU_CODENAME-security main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $UBUNTU_CODENAME-updates main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $UBUNTU_CODENAME-proposed main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ $UBUNTU_CODENAME-backports main restricted universe multiverse
EOF

# Update the system and install necessary tools
echo "Updating system and installing necessary tools..."
sudo apt update -y
sudo apt install -y sshpass curl software-properties-common

# Update APT cache and install pip and Ansible
echo "Updating APT cache and installing pip and Ansible..."
sudo apt install -y python3-pip ansible

# Configure pip to use Aliyun mirrors
echo "Configuring pip to use Aliyun mirrors..."
mkdir -p ~/.pip
tee ~/.pip/pip.conf << 'EOF'
[global]
trusted-host = pypi.tuna.tsinghua.edu.cn
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
EOF

# Install specific version of Ansible
echo "Installing Ansible..."

# Create Ansible configuration file
echo "Creating Ansible configuration file..."
sudo mkdir -p /etc/ansible
sudo tee /etc/ansible/ansible.cfg << 'EOF'
[defaults]
host_key_checking=False
pipelining=True
forks=100
EOF

echo "Script execution completed."
