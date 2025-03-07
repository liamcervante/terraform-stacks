
required_providers {
  aws = {
    source = "hashicorp/aws"
    version = "5.90.0"
  }
}

variable "aws_token" {
  type = string
  ephemeral = true
}

provider "aws" "main" {
  config {
    region = "eu-central-1"
    assume_role_with_web_identity {
      role_arn           = "arn:aws:iam::931787512616:role/stacks-liamcervante-local-agents-terraform-stacks"
      web_identity_token = var.aws_token
    }
  }
}

component "main" {
    source = "./main"
    
    providers = {
        aws = provider.aws.main
    }
}
