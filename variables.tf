locals {
  app_name       = "workspaces-app"
  profile_prefix = "tf-tutorial-workspaces"
}

locals {
  profile = {
    "development" = "${local.profile_prefix}-development"
    "qa"          = "${local.profile_prefix}-qa"
    "staging"     = "${local.profile_prefix}-staging"
    "production"  = "${local.profile_prefix}-production"
  }
  
  region = {
    "development" = "us-west-2"
    "qa"          = "us-east-2"
    "staging"     = "us-east-1"
    "production"  = "ca-central-1"
  }
}

locals {
  environment = "${terraform.workspace}"
}

locals {
  common_tags = {
    Terraform   = "true"
    Environment = local.environment
  }
  name_prefix = "${local.app_name}-${local.environment}"
}

variable "aws_access_key" {
  type = string
  description = "AWS access key"
}

variable "aws_secret_key" {
  type = string
  description = "AWS secret key"
}

variable "env" {
  description = "env: dev or prod"
}
