terraform {
  # Assumes s3 bucket and dynamo DB table already set up
  # See /code/03-basics/aws-backend
  backend "s3" {
    bucket         = "terraformtraining1"
    key            = "06-organization-and-modules/consul/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
module "consul" {
  source = "git::https://github.com/hashicorp/terraform-aws-consul.git"

}