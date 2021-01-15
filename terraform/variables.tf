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

resource "aws_security_group" "default" {
  name        = "terraform_example"
  description = "Used in the terraform"
  vpc_id      = "${aws_vpc.default.id}"
  tags = "${var.tags}"

  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


variable "aws-subnet-id" {}
variable "aws-vpc-security-group-id" {}
variable "aws-instance-type" {}
variable "aws-security-key-name" {}
