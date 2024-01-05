
resource "duplocloud_k8_secret" "database" {

  count = var.database_type == "rds" ? 1 : 0

  tenant_id   = local.tenant_id
  secret_name = "database"
  secret_type = "Opaque"
  secret_data = jsonencode({
    "DATABASE_USERNAME" : var.database_username,
    "DATABASE_PASSWORD" : random_password.password.result
    }
  )
}
