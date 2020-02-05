#!/bin/bash

#
# This is a wrapper for ansible-playbook command, add
# ANSIBLE_HOST_KEY_CHECKING=False before running ansible-playbook,
# user only need to give playbooks path.
#

BASE_PATH=$(cd `dirname $0`; pwd)

if [[ ! -n $1 ]]; then
  echo "Usage: $0 /path/to/playbook.yml"
  exit 1
fi

if [[ ! -e $1 ]]; then
  echo "Can not find $1, please check your yaml file path"
  exit 1
fi

cd $BASE_PATH
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.ini $1
