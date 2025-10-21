variable "instances" {
    default = [ "mongodb","mysql","redis","frontend" ]
  /* default = {
    mongodb = "t3.micro"
    redis = "t3.micro"
    mysql = "t3.micro"
    frontend = "t3.micro"
  } */
}

variable "zoneid" {
  default = "Z0975378N0ET60VBIODO"
}

variable "domain_name" {
  default = "sniggie.fun"
}