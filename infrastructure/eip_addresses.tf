# Elastic/Fixed IP for the source DB
resource "aws_eip" "database_server_ip" {
  domain = "vpc"
  instance = aws_instance.database_server.id
}

output "database_server_eip" {
  value = aws_eip.database_server_ip.public_ip
}
