variable "my_instance_type" { #my_instance_type is the variable here
  type    = string
  default = "t2.micro"
}

variable "ami" {
  type    = string                  #type is required. I need to specify
  default = "ami-05ab8148622e7e926" #defaul is not required
}
