data "aws_ami" "ubuntu_eu" {

  most_recent = true
  owners      = ["099720109477"] # Owner is Canonical
  provider    = aws.eu-west

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

data "aws_ami" "ubuntu_us" {

  most_recent = true
  owners      = ["099720109477"] # Owner is Canonical
  provider    = aws.us-east

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {
  provider = aws.us-east
}

# data "aws_vpc" "prod_vpc" {
#   tags = {
#     Env = "Prod"
#   }
# }

data "aws_availability_zones" "available" {
    state = "available"
}

data "aws_iam_policy_document" "static_website" {
    statement{
        sid = "PublicReadGetObject"

        principals {
            type = "*"
            identifiers = ["*"]
        }

        actions = [ "s3:GetObject" ]

        resources = [ "arn:aws:s3:::*/*" ]
    }
}

resource "aws_s3_bucket" "public_read_bucket" {
    bucket = "my-public-read-bucket-test-007-syukay"

}

output "iam_policy" {
    value = data.aws_iam_policy_document.static_website.json
}

output "azs" {
    value = data.aws_availability_zones.available.id
}

# output "prod_vpc_id" {
#   value = data.aws_vpc.prod_vpc.id
# }

output "aws_caller_identity" {
  value = data.aws_caller_identity.current
}

output "aws_region" {
  value = data.aws_region.current
}

output "ubuntu_ami_data_eu" {
  value = data.aws_ami.ubuntu_eu.id
}

output "ubuntu_ami_data_us" {
  value = data.aws_ami.ubuntu_us.id
}

resource "aws_instance" "web" {
  provider = aws.eu-west
  ami                         = data.aws_ami.ubuntu_eu.id
  associate_public_ip_address = true
  instance_type               = "t2.micro"


  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"
  }
}
