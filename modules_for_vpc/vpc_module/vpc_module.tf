resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block
  provider = aws
  tags = {
    Name = "Daniel-vpc"
    owner = "Daniel"
  }
}

resource "aws_internet_gateway" "igw_vpc" {
    vpc_id = aws_vpc.vpc.id
    provider = aws
    tags = {
        Name = "Daniel-igw"
        owner = "Daniel"
  }
  depends_on = [ aws_vpc.vpc ]
}

resource "aws_subnet" "public_subnet" {
    count = 2
    vpc_id = aws_vpc.vpc.id
    provider = aws
    cidr_block = var.cidr_blocks_public_subnet[count.index]
    availability_zone = var.availability_zones_public_subnet[count.index]
    map_public_ip_on_launch = true
    depends_on = [ aws_vpc.vpc ]
    tags = {
        Name = "Daniel-public-subnet"
        owner = "Daniel"
  }
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.vpc.id
     provider = aws
    cidr_block = var.cidr_block_private_subnet
    availability_zone = var.availability_zone_private_subnet
    map_public_ip_on_launch = true
    depends_on = [ aws_vpc.vpc ]
    tags = {
        Name = "Daniel-private-subnet"
        owner = "Daniel"
  }
}

resource "aws_default_route_table" "rt" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id
   provider = aws
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_vpc.id
  }
    tags = {
        Name = "maral-route-table"
        owner = "maral"
  }
  depends_on = [ aws_vpc.vpc ]
}

resource "aws_route_table_association" "association_rt_igw" {
     provider = aws
  route_table_id = aws_default_route_table.rt.id
  subnet_id = aws_subnet.public_subnet[0].id
  depends_on = [ aws_subnet.public_subnet ]
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet[0].id
}
output "public_subnet_ids" {
  value = aws_subnet.public_subnet[*].id
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

