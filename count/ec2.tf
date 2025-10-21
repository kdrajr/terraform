resource "aws_instance" "roboshop" {
    count = 4
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_all.id]
    tags = {
        Name = var.instances[count.index]
        Terraform = "true"
    }
}

resource "aws_security_group" "allow_all" {
  name   = "allow-all"

  egress {
    from_port        = 0 # from port 0 to to port 0 means all ports
    to_port          = 0 
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"] # internet
  }

  ingress {
    from_port        = 0 # from port 0 to to port 0 means all ports
    to_port          = 0 
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"] # internet
  }

  tags = {
    Name = "allow-all"
  }

}

resource "aws_route53_record" "dns_name" {
    count = 4
    zone_id = var.zoneid
    name    = var.instances[count.index] == "frontend" ? "${var.domain_name}" : "${var.instances[count.index]}.${var.domain_name}"
    type    = "A"
    ttl     = 1
    allow_overwrite = true
    records = var.instances[count.index] == "frontend" ? [aws_instance.roboshop[count.index].public_ip] : [aws_instance.roboshop[count.index].private_ip]
}