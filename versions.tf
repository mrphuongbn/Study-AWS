locals {
  git_pw = "fake-pw"
}
terraform {
  backend "http" {}
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }

    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "~> 1.14"
    }

    local = {
      source = "hashicorp/local"
      version = "~> 2.1.0"
    }
  }


  # random = {
  #   source  = "hashicorp/random"
  #   version = "3.1.0"
  # }
  required_version = "~> 1.0.11"
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}

# provider "aws" {
#   profile = var.env_profile
#   region  = var.region

#   default_tags  {
#     tags = {
#       owner = "CICD Team"
#     }
#   }

# }