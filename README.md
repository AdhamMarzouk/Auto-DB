# Auto-DB
![Terraform Version](https://img.shields.io/badge/Terraform-v1.9.5-purple)
![Ansible Version](https://img.shields.io/badge/Ansible-v2.17.4-blue)

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
    - `ansible.cfg`: Ansible configuration file defining remote settings and inventory.
    - `server_setup.yml`: Ansible playbook to install PostgreSQL, configure remote access, and create a database.

- **/update_inventory.sh**: A shell script to automatically update the Ansible `inventory.ini` with the EC2 instance’s Elastic IP.



## 🏗️ How to Deploy
Follow these steps to deploy Auto-DB

### Prerequisites
- An Ubuntu machine.
- Terraform, Ansible, and AWS CLI installed.
- AWS credentials configured (aws configure).
- SSH access to the EC2 instance (keypair: `Auto-DB-key-pair.pem`).

### Deployment Steps
1. **Fork the Repository**: First, fork this repository to your own GitHub account. This will allow you to modify the project if needed without affecting the original codebase.
    - Navigate to the top-right corner of this repository page and click the Fork button.


2. **Clone Your Fork**: After forking the repository, clone it to your local machine:
    ```
    git clone https://github.com/yourusername/Auto-DB.git
    cd Auto-DB
    ```

3. **Terraform Setup**
    - Navigate to the `infrastructure/` directory:
        ```
        cd infrastructure/
        ```
    - Initialize Terraform:
        ```
        terraform init
        ```
    - Apply the configuration to build the AWS infrastructure:
        ```
        terraform apply
        ```

    - After Terraform finishes, it will output the Elastic IP of the database server.

4. **Inventory Update**
    - Run the bash script that updates the Ansible inventory `inventory.ini` with the new server's IP
        ```
        sh update_inventory.sh
        ```

5. **Ansible Setup**
    - Navigate to the ansible_automation/ directory:
        ```
        cd ansible_automation/
        ```
    - Run the Ansible playbook to install and configure PostgreSQL:
        ```
        ansible-playbook server_setup.yml
        ```



## ⚡ Features
- Automated AWS infrastructure provisioning using Terraform.

- PostgreSQL installation and configuration using Ansible.

- Secure remote access enabled for PostgreSQL.

- Ready-to-use PostgreSQL database (mydb) with user authentication.