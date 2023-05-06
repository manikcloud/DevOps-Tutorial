
# Lesson 06 Demo 6
## Set up Terraform

Steps to be performed:

## Install Terraform from SH Script

```
sudo cchmod 755 tf-installation.sh
sudo sh tf-installation.sh 

```


## Create an AWS Account

1. Go to the AWS website and click on the "Create an AWS Account" button.
2. Follow the on-screen instructions to create your account.
3. Once your account is created, log in to the AWS Management Console.

### Create Access Keys in IAM

1. In the AWS Management Console, navigate to the IAM service.
2. Click on "Users" in the left sidebar, and then click on the "Add User" button.
3. Enter a user name and select "Programmatic Access" as the access type.
4. Click on the "Next: Permissions" button.
5. Choose the appropriate permissions for your user, or attach an existing policy.
6. Click on the "Next: Tags" button.
7. Add any tags (optional) and click on the "Next: Review" button.
8. Review your settings and click on the "Create User" button.
9. Once the user is created, take note of the access key ID and secret access key. You will need these later to configure the AWS CLI.

### Install AWS CLI and Configure it

1. Install AWS CLI using the following command: 
```
sudo apt-get install awscli
```
2. Run the command `aws configure` to configure your access key ID, secret access key, default region, and output format.

