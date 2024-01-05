
output "dns" {
  value = "application-${local.tenant_name}${local.app_base_domain}"
}
