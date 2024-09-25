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
    - `variables.tf`: Define the OS and Instance type of the DB server. Feel free to change it according to your needs

- **/ansible_automation/**: Contains Ansible playbooks and configuration.
    - `ansible.cfg`: Ansible configuration file defining remote settings and inventory.
    - `server_setup.yml`: Ansible playbook to install PostgreSQL, configure remote access, and create a database.
    - `inventory.ini`: The inventory that contains the IP addresses of the Database Server on AWS.

- **/update_inventory.sh**: A shell script to automatically update the Ansible `inventory.ini` with the EC2 instance’s Elastic IP.



## 🏗️ How to Deploy
Follow these steps to deploy Auto-DB

### Prerequisites
- An Ubuntu machine.
- Terraform, Ansible, and AWS CLI installed [Terraform Installation](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli), [Ansible Installation](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html), [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).
- AWS credentials configured [Configure AWS](https://docs.aws.amazon.com/cli/v1/userguide/cli-configure-envvars.html#envvars-set).
- SSH access to the EC2 instance [Create Key-Value Pair](https://docs.aws.amazon.com/whitepapers/latest/teaching-big-data-skills-with-amazon-emr/download-pem-file-for-emr-cluster-access.html#:~:text=In%20the%20left%20navigation%20pane,is%20downloaded%20in%20your%20browser.).

### Deployment Steps
1. **Clone The Repo**: Clone the repository to your local machine:
    ```
    git clone https://github.com/yourusername/Auto-DB.git
    cd Auto-DB
    ```

2. **Terraform Setup**
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

3. **Inventory Update**
    - Run the bash script that updates the Ansible inventory `inventory.ini` with the new server's IP
        ```
        sh update_inventory.sh
        ```

4. **Add the .pem key**
    - Copy the .pem key you've downloaded from AWS inside the `ansible_automation` directory
        ```
        cp /path_to_key_file /Auto-DB/ansible_automation
        ```
    - Ensure that the key is not public
        ```
        chmod 400 "<your_key_file>"
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

6. **Clean Up**
    - Do you want to clean up the resources you've just created?
        ```
        cd infrastructure
        terraform destory
        ```


## ⚡ Features
- Automated AWS infrastructure provisioning using Terraform.

- PostgreSQL installation and configuration using Ansible.

- Secure remote access enabled for PostgreSQL.

- Ready-to-use PostgreSQL database (mydb) with user authentication.