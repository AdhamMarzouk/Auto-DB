# Elastic/Fixed IP for the source DB
resource "aws_eip" "source_db_ip" {
  domain = "vpc"
  instance = aws_instance.source_db.id
}