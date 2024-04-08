## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.5.5)

- <a name="requirement_duplocloud"></a> [duplocloud](#requirement\_duplocloud) (~> 0.10.2)

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws) (5.31.0)

- <a name="provider_duplocloud"></a> [duplocloud](#provider\_duplocloud) (0.10.4)

- <a name="provider_terraform"></a> [terraform](#provider\_terraform)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [duplocloud_duplo_service.admin](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/duplo_service) (resource)
- [duplocloud_duplo_service.application](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/duplo_service) (resource)
- [duplocloud_duplo_service_lbconfigs.admin](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/duplo_service_lbconfigs) (resource)
- [duplocloud_duplo_service_lbconfigs.application](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/duplo_service_lbconfigs) (resource)
- [duplocloud_duplo_service_params.admin](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/duplo_service_params) (resource)
- [duplocloud_duplo_service_params.application](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/duplo_service_params) (resource)
- [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) (data source)
- [duplocloud_tenant.current](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/data-sources/tenant) (data source)
- [duplocloud_tenant_aws_region.current](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/data-sources/tenant_aws_region) (data source)
- [terraform_remote_state.infra](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) (data source)
- [terraform_remote_state.tenant](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) (data source)

## Required Inputs

No required inputs.

## Optional Inputs

No optional inputs.

## Outputs

The following outputs are exported:

### <a name="output_dns"></a> [dns](#output\_dns)

Description: n/a

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.44.0 |
| <a name="requirement_duplocloud"></a> [duplocloud](#requirement\_duplocloud) | ~> 0.10.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.44.0 |
| <a name="provider_duplocloud"></a> [duplocloud](#provider\_duplocloud) | 0.10.16 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [duplocloud_duplo_service.admin](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/duplo_service) | resource |
| [duplocloud_duplo_service.application](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/duplo_service) | resource |
| [duplocloud_duplo_service_lbconfigs.admin](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/duplo_service_lbconfigs) | resource |
| [duplocloud_duplo_service_lbconfigs.application](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/duplo_service_lbconfigs) | resource |
| [duplocloud_duplo_service_params.admin](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/duplo_service_params) | resource |
| [duplocloud_duplo_service_params.application](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/duplo_service_params) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/5.44.0/docs/data-sources/caller_identity) | data source |
| [duplocloud_tenant.current](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/data-sources/tenant) | data source |
| [terraform_remote_state.aws_services](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.infra](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.tenant](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns"></a> [dns](#output\_dns) | n/a |
<!-- END_TF_DOCS -->