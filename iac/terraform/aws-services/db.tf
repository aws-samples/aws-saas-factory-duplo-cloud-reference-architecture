
resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "duplocloud_rds_instance" "db" {

  count = var.database_type == "rds" ? 1 : 0

  tenant_id      = local.tenant_id
  name           = "db"
  engine         = 0
  engine_version = var.database_engine_version
  size           = var.database_size

  master_username = var.database_username
  master_password = random_password.password.result

  encrypt_storage = true
}

# at application startup the schema will be applied, but we first need a database to apply the schema to
resource "kubernetes_manifest" "pod_create_database" {

  count = var.database_type == "rds" ? 1 : 0

  manifest = {
    "apiVersion" = "v1"
    "kind"       = "Pod"
    "metadata" = {
      "namespace" = "duploservices-${local.tenant_name}"
      "labels" = {
        "app.kubernetes.io/name" = "create-database"
      }
      "name" = "create-database"
    }
    "spec" = {
      "containers" = [
        {
          "command" = [
            "sh",
            "-c",
            "mysql -h ${duplocloud_rds_instance.db[0].host} -u ${var.database_username} -p${random_password.password.result} -e 'CREATE DATABASE IF NOT EXISTS sales'",
          ]
          "image" = "mysql:8.1.0"
          "name"  = "create-database"
        },
      ]
    }
  }
}