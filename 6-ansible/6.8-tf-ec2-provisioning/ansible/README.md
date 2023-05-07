# Course Content

This repository contains various resources and scripts used for the course, focusing on Ansible and Terraform.

## Directory Structure

  - **6.8-tf-ec2-provisioning**: Terraform scripts for provisioning EC2 instances and additional Ansible files.
    - README.md
    - deployer
    - deployer.pub
    - main.tf
    - slave-vm.tf
    - ubuntu-vm.tf
    - ansible.cfg: Ansible configuration file.
    - apache.yaml: Ansible playbook for installing Apache.
    - host_vars.yml: Host variables file for Ansible configuration.
    - inventory.ini: Ansible inventory file with server details.
    - jenkins.yaml: Ansible playbook for installing Jenkins.
    - node.yml: Ansible playbook for installing Node.js.
  - **host_vars.yaml**: Host variables file for Ansible configuration.

## Prerequisites

Before using the resources in this repository, make sure you have the following prerequisites installed:

- Ansible
- Terraform
- Git

## How to Clone and Change Directory

To clone the repository and change the directory, follow these steps:

1. Open your terminal or command prompt.
2. Run the following command to clone the repository:

```
git clone https://github.com/manikcloud/DevOps-Tutorial.git
```

# Ansible Setup on Ubuntu

This guide will help you set up Ansible on an Ubuntu system.

## Prerequisites

- An Ubuntu system
- SSH access to a remote server

## Steps

1. Install Ansible on the Ubuntu system:

```
sudo apt update
sudo apt install -y ansible
```

2. Create an inventory file, for example, `inventory.ini`, and add your server details:

```ini
[my_servers]
my_server ansible_host=18.209.59.137
```

3. Create an Ansible configuration file, `ansible.cfg`, and add the following content:

```ini
[defaults]
inventory = inventory.ini
remote_user = ubuntu
private_key_file = ../deployer
host_key_checking = False
retry_files_enabled = False
```

4. Test the Ansible connection to the remote server with the following command:

```
ansible my_servers -m ping
```

Replace 'my_servers' with the appropriate group name


from your inventory file.

# Additional Ansible Files in 6.8 Directory

Below is a brief explanation of the additional Ansible files found in the `6.8` directory:

- **ansible.cfg**: This is the Ansible configuration file that contains settings such as the inventory file path, remote user, private key file, host key checking, and retry file settings.
- **apache.yaml**: This Ansible playbook installs the Apache web server on the target machines. To run the playbook, use the following command:

```
ansible-playbook apache.yaml
```

- **host_vars.yml**: This file contains host-specific variables for Ansible configuration. It allows you to define variables for each host in your inventory.
- **inventory.ini**: This is the Ansible inventory file that contains the server details, such as the server's hostname and IP address.
- **jenkins.yaml**: This Ansible playbook installs Jenkins on the target machines. To run the playbook, use the following command:

```
ansible-playbook jenkins.yaml
```

- **node.yml**: This Ansible playbook installs Node.js on the target machines. To run the playbook, use the following command:

```
ansible-playbook node.yml
```
