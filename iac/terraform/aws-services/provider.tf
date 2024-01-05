
terraform {

  required_version = ">= 1.5.5"

  required_providers {
    duplocloud = {
      source  = "duplocloud/duplocloud"
      version = "~> 0.10.2"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.24.0"
    }
  }

}

provider "duplocloud" {}
provider "random" {}

provider "kubernetes" {
  host                   = data.duplocloud_eks_credentials.prod.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority[0].data)
  token                  = data.duplocloud_eks_credentials.prod.token
}


# this is required to set up cognito and grab the wildcard ACM ARN
provider "aws" {
  # The following credentials are temporary "just in time" credentials created by Duplo.
  access_key = data.duplocloud_admin_aws_credentials.this.access_key_id
  secret_key = data.duplocloud_admin_aws_credentials.this.secret_access_key
  token      = data.duplocloud_admin_aws_credentials.this.session_token
  region     = local.aws_region
  # skip_get_ec2_platforms = true
}