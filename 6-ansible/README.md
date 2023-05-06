# Lesson 06 Demo 2
## Demonstrate YAML Scripting

Steps to be performed:
1. Create a playbook
2. Add YAML script to the playbook to install node
3. Run Ansible YAML script

## Step 1: Create a playbook
1.1 Use the below command to create a node.yml file
    sudo vi node.yml
1.2 Establish SSH key pair in the Linux system to have SSH connectivity with localhost using the following commands:
    ssh-keygen -t rsa (Press Enter when asked for File and Paraphrase details)
    cat .ssh/id_rsa.pub >> .ssh/authorized_keys
    ssh localhost -p 42006 (Type yes when prompted)
1.3 Now, add the host localhost in the Ansible host file /etc/ansible/hosts
    sudo vi /etc/ansible/hosts
1.4 When the file opens, add the below two lines of the code at the end of the file:
    [webservers]
    localhost:42006

## Step 2: Add YAML script to the playbook to install node
2.1 Open the node.yaml file by using the below command and then add the following code
    sudo vi node.yml
2.2 Copy and paste the below code into the node.yml file:
  
  ```
    ---
    - hosts: webservers
      become: true
      tasks:
       - name: add apt key for nodesource
         become: true
         apt_key: url=https://deb.nodesource.com/gpgkey/nodesource.gpg.key
       - name: add repo for nodesource
         become: true
         apt_repository:
                     repo: 'deb https://deb.nodesource.com/node_0.10 {{ ansible_distribution_release }} main'
                     update_cache: no
       - name: install nodejs
         become: true
         apt: name=nodejs
```
2.3 Save the file and exit using shift+esc+: and then type wq

## Step 3: Run Ansible YAML script
3.1 Run apache.yaml file using the below command:
    ansible-playbook node.yml
