# --- s3/providers ---

terraform {
  required_version = ">= v1.0.7"
  backend "local" {}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.2.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile

  ignore_tags {
    keys = var.aws_ignore_tags
  }
}

resource "random_id" "random" {
  byte_length = 8
  for_each    = var.s3_bucket_name
}