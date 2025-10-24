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

module "server" {
  source = "./modules/ec2"
  servername = "testserver"
  associate_public_ip_address = true

  ebs_block_device = [
    {
      device_name = "/dev/sdh"
      volume_size = "4"
      volume_type = "standard"
      delete_on_termination = "true"
    },
    {
      device_name = "/dev/sdj"
      volume_size = "4"
      volume_type = "standard"
      delete_on_termination = "true"
    }
  ]
}