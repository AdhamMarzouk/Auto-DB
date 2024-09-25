# Auto-DB
Welcome to Auto-DB — an automated PostgreSQL database deployment on AWS using Terraform and Ansible! With Auto-DB, you can spin up a fully configured PostgreSQL database on the cloud in no time.

## 🚀 What is Auto-DB?
Auto-DB automates the creation of AWS infrastructure and the installation and configuration of PostgreSQL. It leverages:

- Terraform to set up AWS resources, including VPCs, subnets, security groups, EC2 instances, and Elastic IPs.
- Ansible to install PostgreSQL, configure it to accept remote connections, and create an initial database.


## 🛠️ Project Structure
The project contains the following directories and files:
- **/infrastructure/**: Contains Terraform files that build AWS infrastructure.
    - `networking.tf`: Creates VPC, subnet, internet gateway, route table, and security group.
    - `servers.tf`: Launches an EC2 instance to host the PostgreSQL database.
    - `eip_addresses.tf`: Assigns a fixed Elastic IP to the database server.

- **/ansible_automation/**: Contains Ansible playbooks and configuration.
    - ```ansible.cfg```: Ansible configuration file defining remote settings and inventory.
    - `server_setup.yml`: Ansible playbook to install PostgreSQL, configure remote access, and create a database.

- **/update_inventory.sh**: A shell script to automatically update the Ansible ```inventory.ini``` with the EC2 instance’s Elastic IP.