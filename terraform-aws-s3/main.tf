provider "aws" {
  access_key = var.aws_accesskey
  secret_key = var.aws_secretkey
  region     = var.aws_region
}

#Note: change the bucket name to unique name
#https://aws.amazon.com/premiumsupport/knowledge-center/s3-error-bucket-already-exists/
resource "aws_s3_bucket" "bucket" {
  bucket = "karthik-test-s3-bucket"
  acl    = "private"

  tags = {
    Name        = "test-s3"
    Environment = "personal"
  }
}