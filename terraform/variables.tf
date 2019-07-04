

variable "region" {
  default = "eu-west-1"
}

variable network {
  description = "All network related variables"

  default = {
    vpc_cidr_block    = "99.0.0.0/16"
    subnet_cidr_block = "99.0.10.0/24"

  }
}

variable "key_name" {
  default = ""
}

variable "vpc_id" {
  default = "vpc-065f08191a72f1bec"
}

variable "vpc_private_subnets" {
  default = ["subnet-071d8587d2baf8e16", "subnet-085ce101fa666db2f"]
}

variable "vpc_public_subnets" {
  default = []
}

variable "sec_group" {
  default = "sg-09ebe8562dfa148b5"
}


variable "jenkins_master_instance_type" {
  default = "t2.micro"
}

variable "jenkins_slave_instance_type" {
  default = "t2.micro"
}


variable "max_jenkins_slaves" {
  default = "3"
}

variable "min_jenkins_slaves" {
  default = "1"
}


variable external_ip_check_url {
  default = "http://ipv4.icanhazip.com"
}


variable private_key_file_name {
  default = "ssh_ec2_key.pem"
}

variable tag_name {
  default = "jenkins-master-slave"
}
