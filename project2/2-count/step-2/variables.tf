variable "region" {}

variable "environment" {}

variable "force_destroy" {}

variable "outbound_email" {
  type = bool      # boolean: true or false 
  default = false
}

variable "inbound_email" {
  type = bool
  default = false
}

