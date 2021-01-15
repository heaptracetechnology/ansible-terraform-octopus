variable "access_key" {
    description = "The AWS access key."
    default = ""
}

variable "secret_key" {
    description = "The AWS secret key."
    default = ""
}

variable "region" {
    description = "The AWS region to create resources in."
    default = ""
}

variable "public_key_path" {
  default = "~/.ssh/id_rsa.pub"
}

variable "key_name" {
  default = "terraform-ansible-example-key"
}


variable "aws-subnet-id" {}
variable "aws-vpc-security-group-id" {}
variable "aws-instance-type" {}
variable "aws-security-key-name" {}
