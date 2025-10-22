variable "project" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

/* variable "common_name" {
  default = "${var.project}-${var.environment}"
} */

/* variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f" 
} */

variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "common_tags" {
  type = map
  default = {
    terraform = "true"
    project = "roboshop"
    environment = "dev"
  }
}

variable "sg_name" {
    type = string
    default = "allow_all"
    description = "security group name to assign to an ec2 instance"
  
}
variable "egress_from_port" {
    type = number
    default = 0
}

variable "egress_to_port" {
    type = number
    default = 0
}

variable "ingress_from_port" {
    type = number
    default = 0
}

variable "ingress_to_port" {
    type = number
    default = 0
}

variable "cidr" {
    type = list
    default = ["0.0.0.0/0"]
  
}

variable "protocol" {
    type = string
    default = "-1"
}

variable "sg_tags" {
    type = map
    default = {
        Name = "allow_all"
    }
  
}