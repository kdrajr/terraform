resource "aws_instance" "ansible" {
  ami           = "ami-09c813fb71547fc4f"
  vpc_security_group_ids = [data.aws_security_group.existing_sg.id]
  instance_type = "t3.micro"

  tags = {
    Name = "ansible"
    terraform = true
  }
}

data "aws_security_group" "existing_sg" {
  id = "sg-0f01e6396107117bf"
}

#security_groups = [data.aws_security_group.existing_sg.name]
#name = "devsecgrp" 