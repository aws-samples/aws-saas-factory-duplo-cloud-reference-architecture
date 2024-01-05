
output "infrastructure_name" {
  value       = local.infrastructure_name
  description = "The name of the DuploCloud Infrastructure"
}

output "infrastructure_id" {
  value       = duplocloud_infrastructure.infra.id
  description = "The ID of the DuploCloud Infrastructure"
}

output "infrastructure_region" {
  value       = var.region
  description = "The AWS Region where the DuploCloud Infrastructure is created in"
}

output "app_base_domain" {
  value       = data.external.base_domain.result["app_base_domain"]
  description = "The base domain used for application deployments"
}

output "acm_arn" {
  value       = data.aws_acm_certificate.wildcard.arn
  description = "The ARN of the ACM certificate used for application deployments"
}
