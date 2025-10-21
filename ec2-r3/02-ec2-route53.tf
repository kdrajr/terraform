resource "aws_instance" "devops" {
  ami           = var.ami_id
  vpc_security_group_ids = [data.aws_security_group.existing_scg.id]
  instance_type = var.instance_type

  tags = var.ec2_tags
}

data "aws_security_group" "existing_scg" {
  id = var.scg_id
}



resource "aws_route53_record" "route53" {
  zone_id = var.r53_zoneid
  name    = "${var.ec2_tags.Name}.sniggie.fun"
  type    = "A"
  ttl     = 1
  allow_overwrite = true
  records = var.ec2_tags.Name == "frontend" ? [aws_instance.devops.public_ip] : [aws_instance.devops.private_ip]
}