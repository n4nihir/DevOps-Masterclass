terraform {
  backend "s3" {
    bucket = "nihir-terraform-state-for-project"
    key = "test/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "terraform-state-locks"
    encrypt = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.64.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}