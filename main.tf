provider "aws" {
  version = "~> 2.28"
  profile = lookup(local.profile, local.environment)
  region  = lookup(local.region, local.environment)
}

terraform {
  required_version = "~> 0.12"
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "vanguard"
    workspaces { prefix = "app1-dev" }
  }
}
