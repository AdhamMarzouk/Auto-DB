# The AMI of Ubuntu on AWS
variable "ubuntu_os" {
  description = "The ami for the Ubuntu 24.04 OS on AWS"
  type = string
  default = "ami-0e86e20dae9224db8"
}

# The instance type of the DBs servers
variable "database_server_type" {
  description = "The EC2 instance type required to run the Database engine"
  type = string
  default = "t2.micro"
}