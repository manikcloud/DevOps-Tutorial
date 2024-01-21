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

---


# Setting up WordPress on an Amazon Linux Instance

This guide provides a simplified overview of setting up WordPress on an Amazon Linux instance. **It assumes familiarity with the command line and AWS services.**

**## Steps:**

1. **Launch an Amazon Linux EC2 Instance:**
   - Log into your AWS account.
   - Launch an Amazon Linux EC2 instance.
   - Ensure security groups allow HTTP (port 80) and SSH (port 22) access.

2. **Connect to Your Instance:**
   - Use SSH to connect to your instance:
     ```bash
     ssh -i /path/to/your-key.pem ec2-user@your-instance-public-dns
     ```

3. **Update Your Instance:**
   - Once connected, update your instance:
     ```bash
     sudo yum update -y
     ```

4. **Install Apache Web Server:**
   - Install and start Apache:
     ```bash
     sudo yum install httpd -y
     sudo systemctl start httpd.service
     sudo systemctl enable httpd.service
     ```

5. **Install MySQL (MariaDB):**
   - Install the MariaDB server:
     ```bash
     sudo yum install mariadb-server mariadb -y
     sudo systemctl start mariadb
     sudo mysql_secure_installation
     sudo systemctl enable mariadb.service
     ```

6. **Create a WordPress Database and User:**
   - Log into the MariaDB shell and create a database and user:
     ```sql
     mysql -u root -p
     CREATE DATABASE wordpress;
     GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpressuser'@'localhost' IDENTIFIED BY 'password';
     FLUSH PRIVILEGES;
     EXIT;
     ```

7. **Install PHP:**
   - Install PHP and necessary extensions:
     ```bash
     sudo yum install php php-mysql php-gd php-pear -y
     sudo systemctl restart httpd.service
     ```

8. **Download and Install WordPress:**
   - Download and configure WordPress:
     ```bash
     wget [https://wordpress.org/latest.tar.gz](https://wordpress.org/latest.tar.gz)
     tar -xzf latest.tar.gz
     sudo rsync -avP ~/wordpress/ /var/www/html/
     mkdir /var/www/html/wp-content/uploads
     sudo chown -R apache:apache /var/www/html/*
     ```

9. **Configure WordPress:**
   - Navigate to the `/var/www/html` directory.
   - Rename and edit the WordPress configuration file:
     ```bash
     cd /var/www/html
     mv wp-config-sample.php wp-config.php
     sudo nano wp-config.php
     ```
   - Update the database settings.

10. **Complete Installation Through the Web Interface:**
    - Access your server's domain or IP address in a web browser.
    - Complete the WordPress installation through the web interface.

**## Additional Considerations:**

- **HTTPS:** Set up HTTPS for secure communication.
- **Virtual Hosts:** Configure virtual hosts to manage multiple websites.
- **Server Optimization:** Optimize server performance for WordPress.
- **WordPress Security:** Secure your WordPress installation.



## Conclusion
This project provides a starting point for automating the setup of WordPress sites using Ansible and AWS. It can be extended or modified to suit your specific needs. This project is for demonstration purposes and should not be used as-is for production environments.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)
