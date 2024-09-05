# create a vpc
resource "aws_vpc" "bridge_stream_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "bridge_stream_vpc"
  }
}

# create a subnet to host our server VMs on
resource "aws_subnet" "servers_subnet" {
  vpc_id = aws_vpc.bridge_stream_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "servers_subnet"
  }
}

# Internet gateway for internet connection
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.bridge_stream_vpc.id

  tags = {
    Name = "igw"
  }
}

# the route table for our servers subnet
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

# associate the route table with the servers subnet
resource "aws_route_table_association" "servers_rt_association" {
  subnet_id = aws_subnet.servers_subnet.id
  route_table_id = aws_route_table.servers_subnet_rt.id
}

# The security group for our servers
resource "aws_security_group" "servers_sg" {
  vpc_id = aws_vpc.bridge_stream_vpc.id
  name = "servers_sg"
  description = "The security group configuration for the EC2 servers"

  # port for ssh connection
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # port for http connection
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # port for https connection
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # port for postgrsql connection
  ingress {
    from_port = 5432
    to_port = 5432
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # allow all outbound traffic
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "servers_sg"
  }
}