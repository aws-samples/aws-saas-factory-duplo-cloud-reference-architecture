
resource "duplocloud_tenant" "tenant" {
  account_name = terraform.workspace
  plan_id      = var.infrastructure_name
}
