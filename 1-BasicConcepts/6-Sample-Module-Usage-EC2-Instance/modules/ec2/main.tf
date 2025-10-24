terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.8.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

data "aws_ami" "default" {
  most_recent = "true"
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}
resource "aws_instance" "server" {
  ami = var.ami != "" ? var.ami : data.aws_ami.default.image_id
  instance_type = var.instance_size
  tags = {
    name = "calabvm"
  }
}