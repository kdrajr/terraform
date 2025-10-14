data "aws_route53_zone" "sniggie" {
  name = "sniggie.fun" # Replace with your hosted zone name
  # If it's a private hosted zone, you might also need to specify the VPC ID:
  # vpc_id = "vpc-xxxxxxxxxxxxxxxxx" 
}

output "route53_zone_id" {
  value = data.aws_route53_zone.sniggie.zone_id
}

data "aws_security_group" "devsecgrp" {
  name = "devsecgrp"
}

output "security_group_id_by_name" {
  value = data.aws_security_group.devsecgrp.id
}