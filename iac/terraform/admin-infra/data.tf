
locals {
  infrastructure_name = terraform.workspace
}

data "duplocloud_admin_aws_credentials" "this" {}

# Once the infra is created we need to get the app base domain which will be needed later 
data "external" "base_domain" {
  depends_on = [duplocloud_infrastructure.infra]

  program = ["../../scripts/app-base-domain.sh"]

  query = {
    infra_name = local.infrastructure_name
  }
}
