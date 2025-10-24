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

module "webserver"{
  source = "./modules/ec2"
  servername = "calabvm"
  instance_size = "t2.micro"
  ami = "ami-0528a5175983e7f28"
}