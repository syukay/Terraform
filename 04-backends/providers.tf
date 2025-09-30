terraform {
  required_version = ">= 1.7.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket = "terraform-course-syukay-remote-backend"
    key    = "04-backends/state.tfstate"
    region = "ap-southeast-2"
  }
}

provider "aws" {
  region = "ap-southeast-2"
}

# resource "random_id" "bucket_suffix" {
#     byte_length = 6
# }

# resource "aws_s3_bucket" "example_bucket" {
#     bucket = "example-bucket-${random_id.bucket_suffix.hex}"
# }

# output "bucket_name" {
#     value = aws_s3_bucket.example_bucket.bucket
# }

