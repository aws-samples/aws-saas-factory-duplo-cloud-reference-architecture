## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.5.5)

- <a name="requirement_aws"></a> [aws](#requirement\_aws) (~> 5.0)

- <a name="requirement_duplocloud"></a> [duplocloud](#requirement\_duplocloud) (~> 0.10.2)

- <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) (2.24.0)

- <a name="requirement_random"></a> [random](#requirement\_random) (3.6.0)

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws) (5.31.0)

- <a name="provider_duplocloud"></a> [duplocloud](#provider\_duplocloud) (0.10.4)

- <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) (2.24.0)

- <a name="provider_random"></a> [random](#provider\_random) (3.6.0)

- <a name="provider_terraform"></a> [terraform](#provider\_terraform)

## Modules

The following Modules are called:

### <a name="module_aws_cognito"></a> [aws\_cognito](#module\_aws\_cognito)

Source: lgallard/cognito-user-pool/aws

Version: 0.23.0

## Resources

The following resources are used by this module:

- [aws_iam_policy.cognito](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) (resource)
- [aws_iam_role_policy_attachment.cognito](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) (resource)
- [duplocloud_aws_host.node](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/aws_host) (resource)
- [duplocloud_rds_instance.db](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/resources/rds_instance) (resource)
- [kubernetes_manifest.pod_create_database](https://registry.terraform.io/providers/hashicorp/kubernetes/2.24.0/docs/resources/manifest) (resource)
- [random_password.password](https://registry.terraform.io/providers/hashicorp/random/3.6.0/docs/resources/password) (resource)
- [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) (data source)
- [aws_eks_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster) (data source)
- [aws_iam_policy_document.cognito](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) (data source)
- [duplocloud_admin_aws_credentials.this](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/data-sources/admin_aws_credentials) (data source)
- [duplocloud_eks_credentials.prod](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/data-sources/eks_credentials) (data source)
- [duplocloud_native_host_image.ami](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/data-sources/native_host_image) (data source)
- [duplocloud_tenant.current](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/data-sources/tenant) (data source)
- [duplocloud_tenant_aws_region.current](https://registry.terraform.io/providers/duplocloud/duplocloud/latest/docs/data-sources/tenant_aws_region) (data source)
- [terraform_remote_state.infra](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) (data source)
- [terraform_remote_state.tenant](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) (data source)

## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_database_engine_version"></a> [database\_engine\_version](#input\_database\_engine\_version)

Description: MySQL engine version

Type: `string`

Default: `"8.0.32"`

### <a name="input_database_size"></a> [database\_size](#input\_database\_size)

Description: Storage capacity of the MySQL RDS

Type: `string`

Default: `"db.t3.medium"`

### <a name="input_database_type"></a> [database\_type](#input\_database\_type)

Description: Which type of database the application will use.  Allowed values are: rds or in-memory

Type: `string`

Default: `"in-memory"`

### <a name="input_database_username"></a> [database\_username](#input\_database\_username)

Description: Administrative username for the MySQL RDS

Type: `string`

Default: `"administrator"`

### <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count)

Description: Number of EKS worker nodes

Type: `number`

Default: `2`

### <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type)

Description: Intance type for EKS worker nodes

Type: `string`

Default: `"t3a.medium"`

## Outputs

The following outputs are exported:

### <a name="output_rds_endpoint"></a> [rds\_endpoint](#output\_rds\_endpoint)

Description: n/a

### <a name="output_rds_host"></a> [rds\_host](#output\_rds\_host)

Description: n/a
