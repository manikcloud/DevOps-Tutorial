# DevOps-Tutorial

## Goal
The goal of this project is to provide an example of how to use Ansible to setup a WordPress site on an AWS EC2 instance running Amazon Linux 2.

## Features
- This Ansible playbook will install all necessary dependencies including Python, PHP, Apache, and MariaDB.
- It sets up a WordPress database and user.
- It downloads the latest version of WordPress and configures it to use the database.
- It updates the WordPress config file using an Ansible template.

## Prerequisites
- An AWS account with the necessary permissions to create EC2 instances.
- Ansible installed on your local machine or control node.
- Basic knowledge of Ansible playbooks.

## Usage
1. Clone this repository to your local machine or control node: `git clone https://github.com/manikcloud/DevOps-Tutorial.git`
2. Change into the project directory: `cd DevOps-Tutorial`
3. Update the `aws_linux_vm` variable in the playbook with the IP address or hostname of your EC2 instance.
4. Run the playbook: `ansible-playbook playbook.yml`

## Conclusion
This project provides a starting point for automating the setup of WordPress sites using Ansible and AWS. It can be extended or modified to suit your specific needs. This project is for demonstration purposes and should not be used as-is for production environments.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)
