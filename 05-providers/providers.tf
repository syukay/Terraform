terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

}

provider "aws" {
  region = "eu-west-1"
}

provider "aws" {
  region = "us-east-1"
  alias  = "us-east"
}

resource "aws_s3_bucket" "eu-west-1" {
  bucket = "some-random-bucket-name-sdfhwoeifhwoeifhi"
}

resource "aws_s3_bucket" "ap-southeast" {
  bucket   = "some-random-bucket-name-dsfwedfsdfwefedsfs"
  provider = aws.us-east
}