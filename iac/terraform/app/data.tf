
data "aws_caller_identity" "current" {}

data "duplocloud_tenant" "current" {
  name = local.tenant_name
}

locals {
  tfstate_bucket      = "duplo-tfstate-${data.aws_caller_identity.current.account_id}"
  tenant_name         = terraform.workspace
  tenant_id           = data.duplocloud_tenant.current.id
  app_base_domain     = data.terraform_remote_state.infra.outputs["app_base_domain"]
  acm_arn             = data.terraform_remote_state.infra.outputs["acm_arn"]
  infrastructure_name = data.terraform_remote_state.tenant.outputs["infrastructure_name"]
  # database_type       = data.terraform_remote_state.aws_services.outputs["database_type"]

  cognito_endpoint = data.terraform_remote_state.aws_services.outputs["cognito_endpoint"]
  cognito_ids      = data.terraform_remote_state.aws_services.outputs["cognito_ids"]
  cognito_secrets  = data.terraform_remote_state.aws_services.outputs["cognito_secrets"]
  user_pool_id     = data.terraform_remote_state.aws_services.outputs["user_pool_id"]
}

data "terraform_remote_state" "tenant" {
  backend   = "s3"
  workspace = local.tenant_name
  config = {
    bucket               = local.tfstate_bucket
    workspace_key_prefix = "admin:"
    key                  = "tenant"
    region               = "us-west-2"
  }
}

data "terraform_remote_state" "infra" {
  backend   = "s3"
  workspace = local.infrastructure_name
  config = {
    bucket               = local.tfstate_bucket
    workspace_key_prefix = "admin:"
    key                  = "infra"
    region               = "us-west-2"
  }
}

data "terraform_remote_state" "aws_services" {
  backend   = "s3"
  workspace = local.tenant_name
  config = {
    bucket               = local.tfstate_bucket
    workspace_key_prefix = "tenant:"
    key                  = "aws-services"
    region               = "us-west-2"
  }
}
