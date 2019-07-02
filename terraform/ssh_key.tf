resource "tls_private_key" "ssh_ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "ssh_ec2_key"
  public_key = "${tls_private_key.ssh_ec2_key.public_key_openssh}"
}

resource "local_file" "private_key_ec2" {
  content  = "${tls_private_key.ssh_ec2_key.private_key_pem}"
  filename = "${path.module}/${var.private_key_file_name}"
  provisioner "local-exec" {
    command = "chmod 700 ${path.module}/${var.private_key_file_name}"
  }
}