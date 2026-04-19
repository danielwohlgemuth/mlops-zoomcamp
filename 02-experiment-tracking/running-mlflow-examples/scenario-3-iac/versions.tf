terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket  = var.terraform_state_bucket
    key     = "${var.environment}.tfstate"
    region  = var.aws_region
    profile = var.aws_profile
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile

  default_tags {
    tags = {
      environment = var.environment
      project     = var.project
    }
  }
}
