# Providers

terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.4.1"
    }
    null = {
      source = "hashicorp/null"
    }
  }
  required_version = ">= 1.0.9"
}
