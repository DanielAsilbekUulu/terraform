



variable "availability_zone_public" {
  description = "us-east-1a Availability zone"
  type        = string
}


variable "cidr_block_public" {
  description = "us-east-1a Availability zone"
  type        = string
}



variable "availability_zone_private" {
  description = "us-east-1b Availability zone"
  type        = string
}



variable "cidr_block_private" {
  description = "us-east-1a Availability zone"
  type        = string
}


variable "key_pair_name" {
  description = "Name for the SSH key pair"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "vpc_cidr" {
  description = "IP CIDR range for the security VPC"
  type = string
}