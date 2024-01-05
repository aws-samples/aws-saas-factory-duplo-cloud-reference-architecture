
terraform {
  required_version = ">= 1.5.5"
  required_providers {
    duplocloud = {
      source  = "duplocloud/duplocloud"
      version = "~> 0.10.2"
    }
  }
}

provider "duplocloud" {}
