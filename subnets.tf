# Define the subnets

data "aws_availability_zones" "available" {}
resource "random_integer" "random" {
  min = 1
  max = 100
}

resource "random_shuffle" "public_az" {
  input        = data.aws_availability_zones.available.names
  result_count = 10
}
resource "aws_subnet" "web_server_subnet_1" {
  vpc_id = aws_vpc.startup_vpc.id
  availability_zone     = "us-east-1a"
  cidr_block = "10.0.8.0/24"
  map_public_ip_on_launch = true
  
  tags = {
    Name = "Web Server Subnet - 1"
  }
}

resource "aws_subnet" "web_server_subnet_2" {
  vpc_id = aws_vpc.startup_vpc.id
  availability_zone     = "us-east-2b"
  cidr_block = "10.0.6.0/24"
  map_public_ip_on_launch = true
  
  tags = {
    Name = "Web Server Subnet - 2"
  }
}
