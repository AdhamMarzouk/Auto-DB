resource "aws_eip" "source_db_ip" {
  domain = "vpc"
  instance = aws_instance.source_db.id
}