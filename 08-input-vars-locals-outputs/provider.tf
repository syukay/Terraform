terraform {
  required_version = "~> 1.7.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

}

provider "aws" {
  alias  = "eu-west"
  region = "eu-west-1"
}

provider "aws" {
  region = "eu-west-1" # default provider, optional
}
