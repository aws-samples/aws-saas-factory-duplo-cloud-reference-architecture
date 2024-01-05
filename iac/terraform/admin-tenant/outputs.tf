
output "tenant_id" {
  value       = duplocloud_tenant.tenant.tenant_id
  description = "DuploCloud Tenant ID"
}

output "infrastructure_name" {
  value       = var.infrastructure_name
  description = "Name of the DuploCloud Infrastructure"
}
