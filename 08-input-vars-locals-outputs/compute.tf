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

resource "aws_instance" "compute" {

  ami = data.aws_ami.ubuntu_eu.id

  instance_type = "t2.micro"

  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"
  }

}

