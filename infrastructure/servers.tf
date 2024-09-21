# VM for the source DB
resource "aws_instance" "database_server" {
  instance_type = var.database_server_type
  ami = var.ubuntu_os
  key_name = "etl-side-project"

  subnet_id = aws_subnet.servers_subnet.id
  security_groups = [aws_security_group.servers_sg.id]

  root_block_device {
    volume_size = 15
    volume_type = "gp3"
    delete_on_termination = true
  }

  user_data = <<EOF
  #!/bin/bash
  echo "Updating the system"
  sudo apt update

  echo "Installing python for Ansible hosts"
  sudo apt install -y python3 python3-pip python3-setuptools python3-virtualenv

  echo "Check Python is installed"
  python3 --version
  EOF

  tags = {
    Name = "database_server"
  }
}
