// Jenkins slaves launch configuration
resource "aws_launch_configuration" "jenkins_slave_launch_conf" {
  #name            = "jenkins_slaves_config"
  image_id        = "${data.aws_ami.jenkins-slave.id}"
  instance_type   = "${var.jenkins_slave_instance_type}"
  key_name      = "${aws_key_pair.generated_key.key_name}"
  security_groups = ["${aws_security_group.sec_group.id}"]
  user_data       = "${data.template_file.user_data_slave.rendered}"
  spot_price                  = "0.01"
  associate_public_ip_address = true
  root_block_device {
    volume_type           = "gp2"
    volume_size           = 8
    delete_on_termination = true
  }
  lifecycle {
    create_before_destroy = true
  }
}
// ASG Jenkins slaves
resource "aws_autoscaling_group" "jenkins_slaves" {
  name                 = "jenkins_slaves_asg"
  launch_configuration = "${aws_launch_configuration.jenkins_slave_launch_conf.name}"
  vpc_zone_identifier  = ["${aws_subnet.subnet.id}"]
  min_size             = "${var.min_jenkins_slaves}"
  max_size             = "${var.max_jenkins_slaves}"
  default_cooldown = 30
  depends_on           = ["aws_instance.jenkins_master"]
  lifecycle {
    create_before_destroy = true
  }
  tag {
    key                 = "Name"
    value               = "jenkins_slave"
    propagate_at_launch = true
  }
  tag {
    key                 = "Tool"
    value               = "Terraform"
    propagate_at_launch = true
  }
}