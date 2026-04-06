terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

module "serverless_app" {
  source = "./modules/serverless_app"

  app_name        = var.app_name
  environment     = var.environment
  lambda_runtime  = "python3.12"
  lambda_timeout  = 30
  lambda_memory   = 512
  aurora_username = var.aurora_username
  aurora_password = var.aurora_password
}
