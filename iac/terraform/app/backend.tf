
terraform {
  backend "s3" {
    region               = "us-west-2"
    key                  = "app"
    workspace_key_prefix = "tenant:"
    encrypt              = true
  }
}



