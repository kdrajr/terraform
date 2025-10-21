resource "aws_route53_record" "dns_name" {
    count = length(var.instances)
    zone_id = var.zoneid
    name    = var.instances[count.index] == "frontend" ? "${var.domain_name}" : "${var.instances[count.index]}.${var.domain_name}"
    type    = "A"
    ttl     = 1
    allow_overwrite = true
    records = var.instances[count.index] == "frontend" ? [aws_instance.roboshop[count.index].public_ip] : [aws_instance.roboshop[count.index].private_ip]
}