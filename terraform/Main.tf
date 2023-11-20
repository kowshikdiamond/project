provider "aws" {
  region = "ap-south-1"  # Set your desired AWS region
}

data "aws_key_pair" "existing" {
  key_name = "local-key-pair"
}

data "aws_security_group" "existing" {
  name = "ec2-ssh"
}

resource "aws_instance" "example" {
  ami           = "ami-0287a05f0ef0e9d9a"  # Use a valid AMI ID for your desired operating system
  instance_type = "t2.micro"  # Set your desired instance type
  key_name      = data.aws_key_pair.existing.key_name
  vpc_security_group_ids = [data.aws_security_group.existing.id]

  tags = {
    Name = "example-instance"
  }
}