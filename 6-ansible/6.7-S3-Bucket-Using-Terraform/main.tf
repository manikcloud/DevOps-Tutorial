provider "aws" {

  region = "us-east-1"
}
resource "aws_s3_bucket" "b" {
  bucket = "my-tf1-test-bucket-34561120"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
