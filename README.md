assignment
Terraform Tentacle Terraform configuration files to provision a new AWS Virtual Machine (VM) running Windows Server and install an Octopus Deploy Tentacle on it and register itself with an Octopus Server.

ANSIBLE

with Ansible windows.yml playbook consists of installation of IIS web server with all the roles and features.

OctopusTentacle.ps1 is a script which will create and configure tenctacle which is passed as user data in tf file.

Terraform:

terraform.tf will create the windows instance and take user data from script to install octopus tentacle.

aws.tf / provider.tf of either of one and variables.tf or terraform.tfvars will consists of aws version , the credentials and the variables defined respectively.

To run ansible use command ansible-playbook -i host_ip -u ansible windows.yaml or ansible-playbook windows.yml

Ensure you have an SSH public key at ~/.ssh/id_rsa.pub. https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

To RUN

To run the terraform use command firstly to initialize use terraform init, then terraform plan and finally terraform apply to see final results.

But here you can run deploy.sh to run terraform and ansible playbook
