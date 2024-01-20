# Lesson 06 Demo 7 - Create an S3 Bucket Using Terraform

This document provides the steps to create an S3 bucket using Terraform.

## Steps to be performed

1. Set up Terraform components
2. Create Terraform execution plan

## Step 1: Set up Terraform components

1.1 Run the following commands in the given sequence to set up the Terraform component:

```
pip install awscli
sudo apt-get update
```

1.2 Create a new file to execute this project.



```

mkdir s3back
cd s3back
```

## Step 2: Create a Terraform execution plan
2.1 Create creds.tf under s3back and add the following code:



```

nano creds.tf
```

2.2 Paste the following code:


```


provider "aws" {
  access_key = ""
  secret_key = ""
  token = ""
  region = "us-east-1"
}
```

Note: Use the AWS access credentials provided in the AWS API Access tab in your LMS in your PRACTICE LAB tab as shown in the screenshot.

2.3 Create main.tf under s3back and run the following code:



```

nano main.tf
```

2.4 Paste the following code:



```

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

```

Note: Bucket name (here my-tf-test-bucket) entered here should be unique globally otherwise it may throw an error while executing the script.

2.5 Run the following commands in the given sequence to add the AWS providers:



```

terraform init
```

2.6 Run the following command to commit TF state:



```

terraform plan
```

2.7 Run the following command to create the S3 bucket:



```

terraform apply
```

**Enter a value: Yes**

2.8 Verify the creation of S3 bucket in the AWS Management console.


---

# Creating and Using Secret Access Keys and Access IDs in AWS IAM for Linux VMs

## Steps

1. **Create an IAM User:**
   - Access the AWS Management Console and navigate to IAM.
   - Click "Users" -> "Add user."
   - Assign a meaningful username and select "Programmatic access."
   - Click "Next: Permissions."

2. **Attach Permissions:**
   - Choose an existing policy or create a custom one, granting only necessary permissions.
   - Click "Next: Tags."
   - Optionally add tags.
   - Click "Next: Review."
   - Verify details and click "Create user."

3. **Securely Store Access Key and ID:**
   - Immediately download and securely store the secret access key (not retrievable later).
   - Note the access key ID.

4. **Add Credentials to Linux VM:**
   - Choose a secure storage method:

     - **Environment variables (temporary):**
       ```bash
       export AWS_ACCESS_KEY_ID=YOUR_ACCESS_KEY_ID
       export AWS_SECRET_ACCESS_KEY=YOUR_SECRET_ACCESS_KEY
       ```

     - **AWS CLI configuration file:**
       Create `~/.aws/credentials`:
       ```
       [default]
       aws_access_key_id = YOUR_ACCESS_KEY_ID
       aws_secret_access_key = YOUR_SECRET_ACCESS_KEY
       

     - **AWS SDK environment variables:**
       Set `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` for applications using the SDK.

## Security Best Practices

- **Avoid hardcoding access keys:** Use AWS Secrets Manager or similar for secure storage and rotation.
- **Regularly rotate access keys:** Enhance security.
- **Use strong passwords for IAM users:** Strengthen protection.
- **Enable MFA:** Add a layer of security.
- **Implement AWS CloudTrail:** Log API activity for auditing and analysis.
- **Regularly review and update permissions:** Maintain least privilege.

