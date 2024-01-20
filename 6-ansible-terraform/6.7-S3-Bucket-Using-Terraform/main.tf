
resource "aws_s3_bucket" "bucket" {
  bucket = "varun-tf-test-bucket-0acb9876"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
