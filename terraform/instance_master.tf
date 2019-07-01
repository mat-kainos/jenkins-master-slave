
resource "aws_instance" "jenkins_master" {
  ami                    = "${data.aws_ami.jenkins-master.id}"
  instance_type          = "${var.jenkins_master_instance_type}"
  key_name               = "${var.key_name}"
  subnet_id              = "${element(var.vpc_private_subnets, 0)}"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${var.sec_group}"]

  root_block_device {
    volume_type           = "gp2"
    volume_size           = 8
    delete_on_termination = false
  }
  tags = {
    Name = "jenkins_master"
    Tool = "Terraform"
  }
}