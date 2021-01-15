terraform {
  backend "s3" {
    bucket = "octopus-terraform-releasetour"
    key    = "releasetour.tfstate"
    region = "region"
  }
}


resource "aws_instance" "windows-instance" {
  ami = "ami-e3a2f79f"

  subnet_id                   = "${aws_subnet.default.id}"
  vpc_security_group_ids      = ["${aws_security_group.default.id}"]
  instance_type               = "${aws-instance-type}"
  associate_public_ip_address = true
  monitoring                  = true
  user_data                   = "${file("octopus-tentacle.ps1")}"
    
  resource "aws_key_pair" "auth" {
  key_name   = "${var.key_name}"
  public_key = "${file(var.public_key_path)}"
}
    
    
     # The name of our SSH keypair
  key_name = "${var.key_name}"

  # Our Security group to allow HTTP and SSH access
  vpc_security_group_ids = ["${aws_security_group.default.id}"]

  subnet_id = "${aws_subnet.default.id}"

  # force Terraform to wait until a connection can be made, so that Ansible doesn't fail when trying to provision
  provisioner "remote-exec" {
    # The connection will use the local SSH agent for authentication
    inline = ["echo Successfully connected"]

    # The connection block tells our provisioner how to communicate with the resource (instance)
    connection {
      user = "${local.vm_user}
}
}
  root_block_device {
    volume_size           = 128
    delete_on_termination = true
  }
  tags {
    Name = "Octopus 3.18 Release Tour"
    OwnerContact = "xyz"
  }
}
