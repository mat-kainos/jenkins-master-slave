terraform {
  required_version = "0.12.0"
}

provider aws {
  region  = "eu-west-1"
  version = "2.12"
}

provider template {
  version = "2.1.2"
}