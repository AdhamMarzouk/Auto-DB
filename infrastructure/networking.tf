resource "aws_vpc" "bridge_stream_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "bridge_stream_vpc"
  }
}

resource "aws_subnet" "servers_subnet" {
  vpc_id = aws_vpc.bridge_stream_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "servers_subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.bridge_stream_vpc.id

  tags = {
    Name = "igw"
  }
}

resource "aws_route_table" "servers_subnet_rt" {
  vpc_id = aws_vpc.bridge_stream_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "servers_subnet_rt"
  }
}

resource "aws_route_table_association" "servers_rt_association" {
  subnet_id = aws_subnet.servers_subnet.id
  route_table_id = aws_route_table.servers_subnet_rt.id
}

