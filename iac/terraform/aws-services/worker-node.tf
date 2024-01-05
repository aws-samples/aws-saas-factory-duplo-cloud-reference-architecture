
resource "duplocloud_aws_host" "node" {
  count          = var.instance_count
  tenant_id      = local.tenant_id
  friendly_name  = "host${count.index}"
  image_id       = data.duplocloud_native_host_image.ami.image_id
  capacity       = var.instance_type
  agent_platform = 7
  keypair_type   = 2
  zone           = 0
  user_account   = local.tenant_id
}
