required_providers {
  random = {
    source  = "hashicorp/random"
    version = "~> 3.5.1"
  }

  tfcoremock = {
    source  = "hashicorp/tfcoremock"
    version = "0.4.0"
  }
}

variable "prefix" {
  type = string
}

provider "random" "this" {}
provider "tfcoremock" "this" {
  config {
    use_only_state = true
    fail_on_delete = ["fail_on_delete"]
  }
}

component "bomb" {
  source = "./bomb"
  providers = {
    random     = provider.random.this
    tfcoremock = provider.tfcoremock.this
  }

  inputs = {
    prefix = var.prefix
  }
}

component "child" {
  source = "./child"
  providers = {
    tfcoremock = provider.tfcoremock.this
  }

  inputs = {
    value = component.bomb.test
  }
}