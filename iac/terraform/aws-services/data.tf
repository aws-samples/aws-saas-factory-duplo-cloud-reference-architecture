
data "aws_caller_identity" "current" {}

data "duplocloud_tenant_aws_region" "current" {
  tenant_id = local.tenant_id
}

data "duplocloud_tenant" "current" {
  name = local.tenant_name
}

# Use any AWS terraform resource with just-in-time Duplo credentials!
data "duplocloud_admin_aws_credentials" "this" {}

data "duplocloud_eks_credentials" "prod" {
  plan_id = local.infrastructure_name
}

data "aws_eks_cluster" "cluster" {
  name = data.duplocloud_eks_credentials.prod.name
}

data "duplocloud_native_host_image" "ami" {
  tenant_id     = local.tenant_id
  is_kubernetes = true
}

locals {
  app_base_domain     = data.terraform_remote_state.infra.outputs["app_base_domain"]
  tenant_name         = terraform.workspace
  tfstate_bucket      = "duplo-tfstate-${data.aws_caller_identity.current.account_id}"
  tenant_id           = data.duplocloud_tenant.current.id
  infrastructure_name = data.terraform_remote_state.tenant.outputs["infrastructure_name"]
  aws_region          = data.duplocloud_tenant_aws_region.current.aws_region
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
