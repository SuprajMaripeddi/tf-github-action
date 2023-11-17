terraform {
  backend "s3" {
    bucket         = "suprajtfdemobucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}


provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = var.bucket_name
  acl    = "private"  # Access Control List (ACL)
}


variable "bucket_name" {
  description = "Name for the S3 bucket"
}
