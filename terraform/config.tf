variable "credentials" { type = "map" }


provider "aws" {
  region  = "us-east-2"
  profile = "psf-prod"
}


provider "aws" {
  alias   = "us-west-2"
  region  = "us-west-2"
  profile = "psf-prod"
}


provider "fastly" {
  api_key = "${var.credentials["fastly"]}"
}


terraform {
  backend "s3" {
    bucket         = "pypi-infra-terraform"
    key            = "production"
    region         = "us-east-2"
    dynamodb_table = "pypi-infra-terraform-locks"
    profile        = "psf-prod"
  }
}
