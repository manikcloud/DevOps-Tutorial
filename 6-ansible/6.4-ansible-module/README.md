# README

## Lesson 06 Demo 4 - Ansible Modules

This document provides the steps to execute Ansible modules on a local server.

### Steps to be performed:

1. Execute Ansible modules on a local server.

#### Step 1: Executing Ansible modules with local server

1.1 Run the below commands in the given sequence to execute different Ansible modules.

```
ansible -m setup all
ansible all -m shell -a 'hostname'
ansible webservers -m apt -a 'name=git state=present' --become
ansible webservers -m file -a 'dest=/root/sample.txt state=touch mode=600 owner=root group=root' --become
```

## description of the commands used in the README:

- ansible -m setup webservers: This command uses the setup module to gather facts about the remote hosts listed under the [webservers] group in the Ansible inventory file. The setup module collects a wide range of system information such as OS version, IP addresses, disk space, memory usage, etc.

- ansible webservers -m shell -a 'hostname': This command uses the shell module to execute the hostname command on the remote hosts listed under the [webservers] group in the Ansible inventory file. The shell module allows running shell commands on the remote hosts.

- ansible webservers -m apt -a 'name=git state=present' --become: This command uses the apt module to install the git package on the remote hosts listed under the [webservers] group in the Ansible inventory file. The apt module provides a way to manage packages on Debian-based systems. The --become flag is used to elevate privileges and run the command as the root user.

- ansible webservers -m file -a 'dest=/root/sample.txt state=touch mode=600 owner=root group=root' --become: This command uses the file module to create a new file named sample.txt with root as the owner and group, and the file mode set to 600 on the remote hosts listed under the [webservers] group in the Ansible inventory file. The file module provides a way to manage files and directories on remote hosts. The --become flag is used to elevate privileges and run the command as the root user.