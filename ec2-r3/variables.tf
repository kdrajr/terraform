variable "ami_id" {
    default = "ami-09c813fb71547fc4f"  
}

variable "instance_type" {
  default = "t3.micro"
}

variable "ec2_tags" {
  default = {
    Name = "frontend"
    terraform = "true"
  }
}

variable "scg_id" {
  default = "sg-0f01e6396107117bf"
}

variable "r53_zoneid" {
  default = "Z0975378N0ET60VBIODO"
}