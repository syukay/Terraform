terraform {
  required_version = ">= 1.7.0, < 2.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

}

provider "aws" {
  region = "ap-southeast-2"

}

provider "aws" {
  region = "us-east-1"
  alias  = "us-east"
}

provider "aws" {
  region = "eu-west-1"
  alias  = "eu-west"
}