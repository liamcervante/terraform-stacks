required_providers {
  random = {
    source  = "hashicorp/random"
    version = "~> 3.5.1"
  }

  bombnull = {
    source  = "app.terraform.io/nicktech/bombnull"
    version = "4.1.3"
  }
}

variable "prefix" {
  type = string
}

provider "random" "this" {}
provider "bombnull" "this" {}

component "bomb" {
  source = "./bomb"
  providers = {
    random   = provider.random.this
    bombnull = provider.bombnull.this
  }

  inputs = {
    prefix = var.prefix
  }
}
