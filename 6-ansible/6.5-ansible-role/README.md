## Lesson 06 Demo 5 - Creating and Working with Ansible Roles

This document provides the steps to create and work with Ansible roles.

### Steps to be performed:

1. Install Ansible on Ubuntu, and establish connectivity between Ansible controller and node machine (You can skip this step in case Ansible is already installed)
2. Create Ansible Role
3. Create Ansible tasks
4. Create Ansible template
5. Create Ansible variable
6. Remove unwanted directory
7. Create Ansible role playbook
8. Deploy Ansible role playbook

## Step 1: Install Ansible on Ubuntu, and establish connectivity between Ansible controller and node machine 

If Ansible is not installed on the Ubuntu system, use the following commands to install Ansible:

```
sudo apt-get install -f
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible
```

## Step 2: Create Ansible Role
 2.1 Once we have our Ansible environment ready, create a new project directory. I will create a new project named base to demonstrate Ansible roles example:



```

mkdir base
cd base
```

2.2 To create an Ansible role, use ansible-galaxy init <role_name> to create the role directory structure:

```

cd roles
ansible-galaxy init demor
cd demor
```


2.3 You can use the ls command to list the Ansible role directory structure.

## Step 3: Create Ansible Tasks
3.1 Now update the /etc/motd file using Ansible playbook roles. Create tasks to use the main.yml file present inside the tasks folder.


```


cd tasks
ls
vi main.yml
```

3.2 Enter the following code:


# tasks file for demor
```

- name: copy demor file
  template:
     src: templates/demor.j2
     dest: /etc/demor
     owner: root
     group: root
     mode: 0444
```

## Step 4: Create Ansible Template
4.1 Create the template content which will be used to update /etc/motd in our Ansible roles examples. Create a new template file under the templates directory using some variables.



```

cd ..
cd templates
vi demor.j2
```

4.2 Enter the following details:


```

Welcome to {{ ansible_hostname }}

This file was created on {{ ansible_date_time.date }}
Go away if you have no business being here

Contact {{ system_manager }} if anything is wrong
```

## Step 5: Create Ansible Variable
5.1 We will use the defaults folder to define custom variables which are used in our template file templates/demor.j2.



```

cd ..
cd defaults
ls
vi main.yml
```

5.2 Enter the following details in the file:

```
# defaults file for demor
system_manager: admin@golinuxcloud.com
```

## Step 6: Remove unwanted directories (Optional)
6.1 This step is completely optional. In this Ansible roles example, we will not use other directories so we are deleting them. After deleting the additional directories you can use the tree command to list the directory structure of motd roles.


```


cd ..
rm -rf handlers tests vars
Step 7: Create an Ansible Role Play
```






## Step 7: Create an Ansible Role Playbook

7.1 Now after you create an Ansible role structure, we need a playbook file that will deploy the role to our managed hosts. I will create my playbook file `demor-role.yml` under the `base` project directory.

```
cd ..
cd ..
sudo vi demor-role.yml
```


7.2 Enter the following code in the file:

```


---
- name: use demor role playbook
  hosts: webservers
  user: ansible
  become: true

  roles:
    - role: demor
      system_manager: admin@golinuxcloud.com
```

## Step 8: Deploy Ansible Role Playbook
8.1 Execute the following command:


```


ansible-playbook demor-role.yml
```

Note: In case you get an error asking you to install sshpass program, execute the command: sudo apt install sshpass and then run the ansible-playbook demor-role.yml command.




