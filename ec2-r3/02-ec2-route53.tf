resource "aws_instance" "devops" {
  ami           = "ami-09c813fb71547fc4f"
  vpc_security_group_ids = [data.aws_security_group.existing_scg.id]
  instance_type = "t3.micro"

  tags = {
    Name = "node-1"
    terraform = true
  }
}

data "aws_security_group" "existing_scg" {
  id = "sg-0f01e6396107117bf"
}



resource "aws_route53_record" "route53" {
  zone_id = "Z0975378N0ET60VBIODO"
  name    = "ansible.sniggie.fun"
  type    = "A"
  ttl     = 1
  allow_overwrite = true
  records = [aws_instance.ansible.private_ip]
}