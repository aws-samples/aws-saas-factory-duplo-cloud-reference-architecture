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

- [duplocloud_tenant.tenant](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/tenant) (resource)
- [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) (data source)
- [terraform_remote_state.infra](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_infrastructure_name"></a> [infrastructure\_name](#input\_infrastructure\_name)

Description: Name of the DuploCloud Infrastructure the DuploCloud Tenant should be associated with

Type: `string`

## Optional Inputs

No optional inputs.

## Outputs

The following outputs are exported:

### <a name="output_infrastructure_name"></a> [infrastructure\_name](#output\_infrastructure\_name)

Description: Name of the DuploCloud Infrastructure

### <a name="output_tenant_id"></a> [tenant\_id](#output\_tenant\_id)

Description: DuploCloud Tenant ID
