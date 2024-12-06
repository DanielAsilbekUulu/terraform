#vpc.tf & instance.tf = main.tf 

#----------------------------------------------------------------------------------------------------------------------------------------
# CREATE THE VPC, IGW, and Subnets
# 1 VPC
# 1 IGW
# SUBNETS (1 Public, 1 Private)    
#-----------------------------------------------------------------------------------------

# Create a VPC      # it creates vpc with the cidr block
resource "aws_vpc" "my_vpc_practice" {
  cidr_block = var.vpc_cidr    # Define the CIDR block for your VPC
  tags = {
    Owner = "daniel"
  }
}


# Create an internet gateway
resource "aws_internet_gateway" "my_internet_gateway_practice" {
  vpc_id = aws_vpc.my_vpc_practice.id
  tags = {
    Owner = "daniel"
  }
  depends_on = [aws_vpc.my_vpc_practice]  #depends_on tells Terraform to complete the aws_vpc.my_vpc_practice resource creation first before starting this one
}



# Create a public subnet within the VPC
resource "aws_subnet" "my_public_subnet_practice" {
  vpc_id                  = aws_vpc.my_vpc_practice.id
  cidr_block              = var.cidr_block_public      # Subnet CIDR block
  availability_zone       = var.availability_zone_public    # Specify the AZ
  #map_public_ip_on_launch = true  # Enable auto-assignment of public IP addresses
  tags = {
    Owner = "daniel"
  }
  depends_on = [aws_vpc.my_vpc_practice]    #every block will have this depends_on because we dont have that vpc yet without it we cannot create anything, like subnets, igw etc.
}

# Create a Private Subnet
resource "aws_subnet" "my_private_subnet_practice" {
  vpc_id                  = aws_vpc.my_vpc_practice.id
  cidr_block              = var.cidr_block_private                  # Subnet CIDR block for the private subnet
  availability_zone       = var.availability_zone_private       # Specify the AZ
 # map_public_ip_on_launch = false  # Do not auto-assign public IPs to instances
  tags = {
    Owner = "daniel"
  }
  depends_on = [aws_vpc.my_vpc_practice]
}


#simple subnet code sample
# resource "aws_subnet" "main" {     
# vpc_id     = aws_vpc.main.id
#  cidr_block = "10.0.1.0/24"
#
# tags = {
#   Name = "Main"
# }
#}



#--------------------------------------------------------------------------------------------------------------------------------------------
# NOW WE CREATE ROUTE TABLE AND ASSOCIATIONS
#--------------------------------------------------------------------------------------------------------------------------------------------


# Create a route table for public subnet
resource "aws_default_route_table" "my_route_table_practice" {
  default_route_table_id = aws_vpc.my_vpc_practice.main_route_table_id

  route {
    cidr_block = "0.0.0.0/0"     # Route all traffic to the internet      #my resources within the vpc can access the internet. So, I have an IGW, pls route all the traffic from my vpc to the world, open access to me.
    gateway_id = aws_internet_gateway.my_internet_gateway_practice.id    
  }

  tags = {
   Owner = "daniel"
  }
  depends_on = [aws_vpc.my_vpc_practice]
}


# Associate the route table with the subnet
resource "aws_route_table_association" "my_route_table_association_practice" {
  subnet_id      = aws_subnet.my_public_subnet_practice.id   #only public subnets for the IGW, private for NAT
  route_table_id = aws_vpc.my_vpc_practice.main_route_table_id

  depends_on = [aws_subnet.my_public_subnet_practice]
}


