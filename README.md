# Usage

This repo is a collection of useful ansible playbooks used by myself.

I ran these playbooks from my own PC or dev server, the public keys is
the same as I inject into the cloud servers.

I used these playbooks to do initial configurations or bootstrap
servers like update epel source and do system update.

Mainly used for CentOS 7, not tested for other OS.

# Prepare

On CentOS7, we need sshpass and ansible installed.

# Change Hostname

## Reboot

```
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -e 'reboot=True' -i hosts.ini playbooks/change_hostname.yml
```

## Without Reboot

```
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts.ini playbooks/change_hostname.yml
```
