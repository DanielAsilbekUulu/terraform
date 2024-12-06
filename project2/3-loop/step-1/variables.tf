variable "region" {}

variable "force_destroy" {}

variable "environment" {}

variable "buckets" {
  type = set(string)    # it means it's gonna have multiple items in it 
}

