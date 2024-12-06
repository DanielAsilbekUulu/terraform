# this is a new way of doing interpolation

provider "aws" {
  region = var.region
}




# this is a old way of doing interpolation

#provider "aws" {
# region = "${var.region}"
#}