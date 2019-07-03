output ec2_connection_strings {
  value = "${formatlist(
    "ssh -i ${path.cwd}/${var.private_key_file_name} centos@%s",
    aws_instance.jenkins_master.*.public_dns
  )}"
}


output jenkins_slave_config  {

  value = "${data.template_file.user_data_slave.rendered}"
}
