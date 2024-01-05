
resource "duplocloud_infrastructure" "infra" {
  infra_name         = local.infrastructure_name
  cloud              = 0
  region             = var.region
  azcount            = 2
  enable_k8_cluster  = true
  enable_ecs_cluster = false
  address_prefix     = "10.${var.cidr_bit}.0.0/16"
  subnet_cidr        = 24
}
