data "aws_ami" "jenkins-master" {
  most_recent = true
  owners      = ["self"]
  filter {
    name   = "name"
    values = ["jenkins-master-poc"]
  }
}
data "aws_ami" "jenkins-slave" {
  most_recent = true
  owners      = ["self"]
  filter {
    name   = "name"
    values = ["jenkins-slave-poc"]
  }
}


data "template_file" "user_data_slave" {
  template = "${file("scripts/user_data.tpl")}"
  vars = {
    jenkins_url            = "http://${aws_instance.jenkins_master.private_ip}:8080"
    jenkins_username       = "${var.jenkins_username}"
    jenkins_password       = "${var.jenkins_password}"
    jenkins_credentials_id = "${var.jenkins_credentials_id}"
  }
}