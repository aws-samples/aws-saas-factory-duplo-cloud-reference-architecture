
output "rds_host" {
  value = duplocloud_rds_instance.db[*].host
}

output "rds_endpoint" {
  value = duplocloud_rds_instance.db[*].endpoint
}

output "cognito_endpoint" {
  value = module.aws_cognito.endpoint
}

output "cognito_ids" {
  value = module.aws_cognito.client_ids
}

output "cognito_secrets" {
  value     = module.aws_cognito.client_secrets
  sensitive = true
}

output "user_pool_id" {
  value = module.aws_cognito.id
}

output "database_type" {
  value = var.database_type
}
