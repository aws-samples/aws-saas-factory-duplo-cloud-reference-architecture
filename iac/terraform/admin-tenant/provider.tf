
terraform {
  required_version = ">= 1.5.5"
  required_providers {
    duplocloud = {
      source  = "duplocloud/duplocloud"
      version = "~> 0.10.2"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.44.0"
    }
  }
}

provider "duplocloud" {}
