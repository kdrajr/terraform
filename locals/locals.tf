locals {
  ami_id = data.aws_ami.devops-practice.id
  instance_type = "t3.micro"
  common_name = "${var.project}-${var.environment}"
  ec2_tags = merge(var.common_tags, 
            {
              Name = "${local.common_name}-local-demo"
            }
          )
}