
data "aws_caller_identity" "current" {}

locals {
  tfstate_bucket = "duplo-tfstate-${data.aws_caller_identity.current.account_id}"
}

data "terraform_remote_state" "infra" {
  backend   = "s3"
  workspace = var.infrastructure_name
  config = {
    bucket               = local.tfstate_bucket
    workspace_key_prefix = "admin:"
    key                  = "infra"
    region               = "us-west-2"
  }
}
