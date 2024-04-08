## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.5.5)

- <a name="requirement_aws"></a> [aws](#requirement\_aws) (~> 5.0)

- <a name="requirement_duplocloud"></a> [duplocloud](#requirement\_duplocloud) (~> 0.10.2)

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws) (5.31.0)

- <a name="provider_duplocloud"></a> [duplocloud](#provider\_duplocloud) (0.10.4)

- <a name="provider_external"></a> [external](#provider\_external) (2.3.2)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [duplocloud_infrastructure.infra](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/infrastructure) (resource)
- [duplocloud_plan_certificates.acm](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/plan_certificates) (resource)
- [aws_acm_certificate.wildcard](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/acm_certificate) (data source)
- [duplocloud_admin_aws_credentials.this](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/data-sources/admin_aws_credentials) (data source)
- [external_external.base_domain](https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external) (data source)

## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_cidr_bit"></a> [cidr\_bit](#input\_cidr\_bit)

Description: This will control the 2rd octet of the AWS VPC created by the DuploCloud Infrastructure

Type: `string`

Default: `"1"`

### <a name="input_region"></a> [region](#input\_region)

Description: Which AWS Region will the DuploCloud Infrastructure be created in

Type: `string`

Default: `"us-east-1"`

## Outputs

The following outputs are exported:

### <a name="output_acm_arn"></a> [acm\_arn](#output\_acm\_arn)

Description: The ARN of the ACM certificate used for application deployments

### <a name="output_app_base_domain"></a> [app\_base\_domain](#output\_app\_base\_domain)

Description: The base domain used for application deployments

### <a name="output_infrastructure_id"></a> [infrastructure\_id](#output\_infrastructure\_id)

Description: The ID of the DuploCloud Infrastructure

### <a name="output_infrastructure_name"></a> [infrastructure\_name](#output\_infrastructure\_name)

Description: The name of the DuploCloud Infrastructure

### <a name="output_infrastructure_region"></a> [infrastructure\_region](#output\_infrastructure\_region)

Description: The AWS Region where the DuploCloud Infrastructure is created in

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_duplocloud"></a> [duplocloud](#requirement\_duplocloud) | ~> 0.10.2 |
| <a name="requirement_external"></a> [external](#requirement\_external) | 2.3.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.44.0 |
| <a name="provider_duplocloud"></a> [duplocloud](#provider\_duplocloud) | 0.10.16 |
| <a name="provider_external"></a> [external](#provider\_external) | 2.3.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [duplocloud_infrastructure.infra](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/infrastructure) | resource |
| [duplocloud_plan_certificates.acm](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/plan_certificates) | resource |
| [aws_acm_certificate.wildcard](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/acm_certificate) | data source |
| [duplocloud_admin_aws_credentials.this](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/data-sources/admin_aws_credentials) | data source |
| [external_external.base_domain](https://registry.terraform.io/providers/hashicorp/external/2.3.3/docs/data-sources/external) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_bit"></a> [cidr\_bit](#input\_cidr\_bit) | This will control the 2rd octet of the AWS VPC created by the DuploCloud Infrastructure | `string` | `"1"` | no |
| <a name="input_region"></a> [region](#input\_region) | Which AWS Region will the DuploCloud Infrastructure be created in | `string` | `"us-east-1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acm_arn"></a> [acm\_arn](#output\_acm\_arn) | The ARN of the ACM certificate used for application deployments |
| <a name="output_app_base_domain"></a> [app\_base\_domain](#output\_app\_base\_domain) | The base domain used for application deployments |
| <a name="output_infrastructure_id"></a> [infrastructure\_id](#output\_infrastructure\_id) | The ID of the DuploCloud Infrastructure |
| <a name="output_infrastructure_name"></a> [infrastructure\_name](#output\_infrastructure\_name) | The name of the DuploCloud Infrastructure |
| <a name="output_infrastructure_region"></a> [infrastructure\_region](#output\_infrastructure\_region) | The AWS Region where the DuploCloud Infrastructure is created in |
<!-- END_TF_DOCS -->