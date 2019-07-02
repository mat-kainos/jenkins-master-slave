output ec2_connection_strings {
  value = "${formatlist(
    "ssh -i ${path.cwd}/${var.private_key_file_name} ec2-user@%s",
    aws_instance.jenkins_master.*.public_dns
  )}"
}
