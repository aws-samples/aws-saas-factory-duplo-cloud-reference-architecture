
terraform {
  backend "s3" {
    region               = "us-west-2"
    key                  = "aws-services"
    workspace_key_prefix = "tenant:"
    encrypt              = true
  }
}
