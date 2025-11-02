resource "aws_s3_bucket" "static" {
  bucket = var.bucket_name
  acl    = "private"
}

variable "bucket_name" {}
