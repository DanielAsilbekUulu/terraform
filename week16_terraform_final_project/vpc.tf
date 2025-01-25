module "vpc_for_us" {
  source = "../modules_for_vpc/vpc_module"
  providers = {
    aws = aws
  }
  cidr_block = "10.0.0.0/16"
  cidr_blocks_public_subnet = ["10.0.1.0/24", "10.0.3.0/24"]
  cidr_block_private_subnet = "10.0.2.0/24"
  availability_zone_private_subnet = "us-east-1a"
  availability_zones_public_subnet = ["us-east-1b", "us-east-1c"]
}

module "vpc_for_asia" {
  source = "../modules_for_vpc/vpc_module"
  providers = {
    aws = aws.asia
  }
  cidr_block = "10.1.0.0/16"
  cidr_blocks_public_subnet = ["10.1.1.0/24","10.1.3.0/24"]
  cidr_block_private_subnet = "10.1.2.0/24"
  availability_zone_private_subnet = "ap-southeast-1a"
  availability_zones_public_subnet = ["ap-southeast-1b","ap-southeast-1c"]
}

module "vpc_for_europe" {
  source = "../modules_for_vpc/vpc_module"
  providers = {
    aws = aws.europe
  }
  cidr_block = "10.2.0.0/16"
  cidr_blocks_public_subnet = ["10.2.1.0/24", "10.2.3.0/24"]
  cidr_block_private_subnet = "10.2.2.0/24"
  availability_zone_private_subnet = "eu-west-1a"
  availability_zones_public_subnet =[ "eu-west-1b",  "eu-west-1c"]
} 

