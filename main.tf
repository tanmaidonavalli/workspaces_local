provider "aws" {
  version = "~> 2.28"
   region = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

terraform {
  required_version = "~> 0.12"
  backend "s3" {
    key            = "terraform.tfstate"
    bucket         = local.name_prefix
    dynamodb_table = "terraform-state-lock-app1dev"
    region         = "us-east-1"
    encrypt        = true
    workspaces { prefix = "app1-dev" }
  }
}
