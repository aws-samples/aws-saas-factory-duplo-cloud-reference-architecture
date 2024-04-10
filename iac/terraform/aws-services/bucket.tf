
resource "duplocloud_s3_bucket" "backups" {
  tenant_id = local.tenant_id
  name      = "backups"
}
