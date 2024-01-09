
locals {
  # this is always used for admin portal and for application when db type set to memory
  base_environment_variables = {
    "Env" : [
      {
        "Name" : "COGNITO_ENDPOINT",
        "Value" : local.cognito_endpoint
      },
      {
        "Name" : "COGNITO_CLIENT_ID",
        "Value" : local.cognito_ids[0]
      },
      {
        "Name" : "COGNITO_SECRET_ID",
        "Value" : local.cognito_secrets[0]
      },
      {
        "Name" : "USER_POOL_ID",
        "Value" : local.user_pool_id
      }
    ]
  }
  rds_environment_variables = {
    "Env" : [
      {
        "Name" : "COGNITO_ENDPOINT",
        "Value" : local.cognito_endpoint
      },
      {
        "Name" : "COGNITO_CLIENT_ID",
        "Value" : local.cognito_ids[0]
      },
      {
        "Name" : "COGNITO_SECRET_ID",
        "Value" : local.cognito_secrets[0]
      },
      {
        "Name" : "USER_POOL_ID",
        "Value" : local.user_pool_id
      },
      {
        "name" : "DATABASE_USERNAME",
        "valueFrom" : {
          "secretKeyRef" : {
            "key" : "DATABASE_USERNAME",
            "name" : "database"
          }
        }
      },
      {
        "name" : "DATABASE_PASSWORD",
        "valueFrom" : {
          "secretKeyRef" : {
            "key" : "DATABASE_PASSWORD",
            "name" : "database"
          }
        }
      }
    ]
  }
}

resource "duplocloud_duplo_service" "admin" {
  tenant_id                            = local.tenant_id
  name                                 = "admin"
  agent_platform                       = 7
  docker_image                         = "public.ecr.aws/t5r4o8x0/saas-store/admin:latest"
  replicas                             = 1
  cloud_creds_from_k8s_service_account = true

  other_docker_config = jsonencode(local.base_environment_variables)
}

resource "duplocloud_duplo_service_params" "admin" {
  tenant_id                   = local.tenant_id
  replication_controller_name = duplocloud_duplo_service.admin.name

  dns_prfx = "admin-${local.tenant_name}"

  http_to_https_redirect = true
}


resource "duplocloud_duplo_service_lbconfigs" "admin" {
  tenant_id                   = local.tenant_id
  replication_controller_name = duplocloud_duplo_service.admin.name

  lbconfigs {
    certificate_arn  = local.acm_arn
    external_port    = 443
    health_check_url = "/"
    is_native        = false
    lb_type          = 1
    port             = "8081"
    protocol         = "http"
  }
}

resource "duplocloud_duplo_service" "application" {
  tenant_id                            = local.tenant_id
  name                                 = "application"
  agent_platform                       = 7
  docker_image                         = "public.ecr.aws/t5r4o8x0/saas-store/application:latest"
  replicas                             = 1
  cloud_creds_from_k8s_service_account = true

  other_docker_config = jsonencode(local.database_type == "rds" ? local.rds_environment_variables : local.base_environment_variables)
}


resource "duplocloud_duplo_service_params" "application" {
  tenant_id                   = local.tenant_id
  replication_controller_name = duplocloud_duplo_service.application.name

  dns_prfx = "application-${local.tenant_name}"

  http_to_https_redirect = true
}


resource "duplocloud_duplo_service_lbconfigs" "application" {
  tenant_id                   = local.tenant_id
  replication_controller_name = duplocloud_duplo_service.application.name

  lbconfigs {
    certificate_arn  = local.acm_arn
    external_port    = 443
    health_check_url = "/"
    is_native        = false
    lb_type          = 1
    port             = "8082"
    protocol         = "http"
  }
}
