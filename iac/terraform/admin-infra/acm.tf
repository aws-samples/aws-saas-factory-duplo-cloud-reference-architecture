
# app_base_domain will be in the form of: .test10-apps.duplocloud.net
# the ACM certificate we are looking up will be in the form of: *.test10-apps.duplocloud.net
data "aws_acm_certificate" "wildcard" {
  domain   = "*${data.external.base_domain.result["app_base_domain"]}"
  types    = ["AMAZON_ISSUED"]
  statuses = ["ISSUED"]
}

# ensure the wildcard application ACM certificate is added to the Infrastructure Plan so it is available for application deployments
# this will be fixed in FIND DUPLO TICKET
resource "duplocloud_plan_certificates" "acm" {
  plan_id = local.infrastructure_name

  certificate {
    name = "default"
    id   = data.aws_acm_certificate.wildcard.arn
  }
}
