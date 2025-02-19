terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.68.0"
    }

  }
  backend "s3" {
    bucket         = "82s-remote-state-poorna"
    key            = "expence-backend-infra"#you should have unique key with in the bucket, same keys should not use for other repos and tf projects
    region         = "us-east-1"
    dynamodb_table = "82s-remote-state-poorna"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}