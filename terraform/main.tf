terraform {
  required_version = "0.12.0"
}

provider aws {
  region  = "eu-west-1"
  version = "2.12"
}

provider http {
  version = "1.1.1"
}

provider tls {
  version = "2.0.1"
}

provider local {
  version = "1.2"
}

provider null {
  version = "2.1.2"
}

provider template {
  version = "2.1.2"
}