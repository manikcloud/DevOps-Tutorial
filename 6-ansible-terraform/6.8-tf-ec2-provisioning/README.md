# Create EC2 instances with Terraform

This branch contains Terraform code to create EC2 instances in AWS. 

## Related Blog Posts By Author:

- [DevSecOps CI/CD Java Tomcat Project](https://varunmanik1.medium.com/devsecops-cicd-java-tomcat-project-141d6b73e436)
- [DevOps Jenkins AWS Series Part 1: How to Install Jenkins on AWS Ubuntu 22.04](https://varunmanik1.medium.com/devops-jenkins-aws-series-part-1-how-to-install-jenkins-on-aws-ubuntu-22-04-cb0c3cdb055)
- [DevOps Jenkins AWS Series Part 2: Setup AWS CloudShell, Install Terraform in Persistent](https://varunmanik1.medium.com/devops-jenkins-aws-series-part-2-setup-aws-cloudshell-install-terraform-in-persistent-425dc0537cf5)


## Prerequisites

Before you start, make sure you have the following:

- An AWS account, with ec2 full access permission 
- And Linux Terminal, wher you can run all these commands 

## Files

- `README.md`: This file, providing an overview of the branch.
- `deployer` and `deployer.pub`: SSH keys for accessing the EC2 instances.
- `history.txt`: A text file with a record of changes to this project.
- `jenkins-installation-ubuntu.sh`: A shell script to install Jenkins on the EC2 instance.
- `main.tf`: The main Terraform configuration file that creates the AWS resources.
- `slave-vm.tf`: A Terraform configuration file that creates a Jenkins slave instance.
- `tf-cli-installation.sh`: A shell script to install the Terraform CLI on the EC2 instance.
- `ubuntu-vm.tf`: A Terraform configuration file that creates an Ubuntu EC2 instance.

## Usage

To create EC2 instances with Terraform, follow these steps:

1. Clone this repository to your local machine by running the command: `git clone https://github.com/manikcloud/Jenkins-cicd.git`.
2. Switch to the `0.1_create_ec2_tf` branch by running the command: `git checkout 0.1_create_ec2_tf`.
3. Navigate to the `terraform` directory by running the command: `cd terraform`.
4. Initialize Terraform by running the command: `terraform init`.
5. Create an execution plan by running the command: `terraform plan`.
6. Apply the execution plan by running the command: `terraform apply`.

You will be prompted to enter values for the variables defined in the `variables.tf` file. 


Create an AWS Account

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

## Install Terraform from SH Script

```
sudo chmod 755  chmod 755 tf-cli-installation.sh 
sudo sh  chmod 755 tf-cli-installation.sh 

```
# OR

## Install Terraform Manual 
1. Set the desired Terraform version: `TERRAFORM_VERSION="1.4.5"`
2. Download Terraform: 
```
wget "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
```
3. Install unzip if not installed: 
```
sudo apt-get update && sudo apt-get install -y unzip
```
4. Unzip the Terraform package: 
```
unzip "terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
```
5. Move the Terraform binary to the /usr/local/bin folder: 
```
sudo cp terraform /usr/local/bin/ && sudo mv terraform /usr/bin/
```
6. Clean up the downloaded zip file: 
```
rm "terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
```
7. Verify the installation: 
```
terraform --version
```
That's it! With an AWS account, access keys, AWS CLI, and Terraform installed and configured, you're ready to use Terraform to create AWS resources.


After the Terraform code has finished executing, you can choose one of the following options to install Jenkins:

### Option 1.1 : Install Jenkins by SH Script

```
chmod 755 jenkins-installation-ubuntu.sh
sudo sh jenkins-installation-ubuntu.sh
```

### Option 1.2 : Manually Install Jenkins

To manually install Jenkins, follow these steps:

1. SSH into the Ubuntu EC2 instance created by Terraform by running the command:
 `ssh -i deployer ubuntu@<public-ip-of-instance>`.

2. Install Java by running the command:
 `sudo apt-get update && sudo apt-get install default-jdk`.

3. Add the Jenkins repository key by running the command:
 
4. Add the Jenkins repository by running the command: 

```

sudo mkdir -p /usr/share/keyrings

sudo curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee   /usr/share/keyrings/jenkins-keyring.asc > /dev/null

sudo echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]   https://pkg.jenkins.io/debian-stable binary/ | sudo tee   /etc/apt/sources.list.d/jenkins.list > /dev/null

```
5. Update the package list by running the command,

6. Install Jenkins by running the command:

```
sudo apt-get update
sudo apt-get install jenkins
   ```
### Option 2: Use Terraform to Install Jenkins

To use Terraform to install Jenkins, follow these steps:

1. SSH into the Ubuntu EC2 instance created by Terraform by running the command: 
`ssh -i deployer ubuntu@<public-ip-of-instance>`.

2. Run the Jenkins installation script by running the command:
`sudo sh /home/ubuntu/jenkins-installation-ubuntu.sh`.

3. The script will install Jenkins and its dependencies. Once the installation is complete, Jenkins will be running on the EC2 instance.

## Clean Up

To destroy the EC2 instances and associated resources, run the command: `terraform destroy`

Note: This will delete all resources created by Terraform in this branch.


## For More info on lab machine plz expend below:

<details>
# Jenkins-cicd
PG DO - CI/CD Pipeline with Jenkins Simplilearn 

# AWS Ubuntu VM Provisioning steps
-	Step 1:  Click on Launch Instance 
-	Step 2 : Click on Software Image (AMI)
-	Select Ubuntu 
-	Step 4: Key pair name – required
-	Click on Create new key pair
-	Put key pair name Jenkins-sl
-	& Download it 
-	Step 5 : Click on Launch Instance 
-	Step 6 : Select your VM and Click connect 
-	Step 7 :  You can see the terminal 
-	Step: Showing Github example

# Git Status
```
git --version 
```
## cretae Dir 
```
mkdir demo 
cd  demo 
```
## GIT & Ubuntu SSH connection
```
ssh-keygen 

"Hit enter button 3 time"

cat ~/.ssh/id_rsa.pub 
git clone git@github.com:manikcloud/Jenkins-cicd.git
history 
history | cut -c 8- 
```

# Jenkins installation on UBUNTU 18.04 & Ubuntu 22.04 

### Step 1
```
sudo apt-get update -y && sudo apt install openjdk-8-jdk -y
```
### Step 2: Downloading Key
```
sudo wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add
```

### Step 3: Adding Key
```
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
```

### Step 4: Jenkins Package installation
```
sudo apt-get update -y && sudo apt install jenkins -y
sudo /etc/init.d/jenkins start
sudo service jenkins status 
```
### Step 5: Jenkins default password
```
sudo cat /home/labsuser/jenkins/secrets/initialAdminPassword
```
### Step 6: History command

```
history | cut -c 8- 

```
# Jenkins URL with port 8080
- http://x.x.x.x:8080/

Replace x with your ip 

# Change Security group rule for Jenkins 
```
-	Select your instance 
-	Down below select your security tab 
-	Click on the Security groups sg-0c51908b5fa4abf75 (launch-wizard-2)
-	Click on the action 
-	Click on EDIT INBOUND RULE
-	Select custom TCP and put port 8080
-	Custom ip should be 0.0.0.0/0
-	Click on Save the rule
```

# Common error

```
getting "E: Unable to locate package openjdk-8-jdk" message on java update
```

# Resolution 
Run this command

```
sudo apt update -y
```
# Plugin Installation 
dashboard>manage>jenkins>manage plugins>maven integration



# Jenkins Setting

```
Java_Home
/usr/lib/jvm/java-8-openjdk-amd64/
```

# Post Build Step

```
java -cp target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App

```

# This project is parameterized
```
echo "User First name is : $First_Name"
echo "User Last name is : $Last_Name"
echo "User Gender is : $Sex"

```
</details>

# References: 
1. https://maven.apache.org/guides/getting-started/maven-in-five-minutes.html
2. https://maven.apache.org/download.cgi

## Connect & Follow

For more info, please connect and follow me:

- Github: [https://github.com/manikcloud](https://github.com/manikcloud)
- LinkedIn: [https://www.linkedin.com/in/vkmanik/](https://www.linkedin.com/in/vkmanik/)
- Email: [varunmanik1@gmail.com](mailto:varunmanik1@gmail.com)
- Facebook: [https://www.facebook.com/cloudvirtualization/](https://www.facebook.com/cloudvirtualization/)
- YouTube: [https://bit.ly/32fknRN](https://bit.ly/32fknRN)
- Twitter: [https://twitter.com/varunkmanik](https://twitter.com/varunkmanik)

