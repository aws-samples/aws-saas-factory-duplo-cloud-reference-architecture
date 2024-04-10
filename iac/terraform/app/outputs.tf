
output "application-dns" {
  value = "application-${local.tenant_name}${local.app_base_domain}"
}

output "admin-dns" {
  value = "admin-${local.tenant_name}${local.app_base_domain}"
}
