resource "aws_instance" "ansible" {
  name = "ansible"
  ami           = "ami-09c813fb71547fc4f"
  vpc_security_group_ids = "sg-0f01e6396107117bf"
  instance_type = "t3.micro"

  tags = {
    Name = "terraform"
  }
}

