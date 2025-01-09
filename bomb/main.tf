terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.3.2"
    }

    tfcoremock = {
      source  = "hashicorp/tfcoremock"
      version = "0.4.0"
    }
  }
}

variable "prefix" {
  type = string
}

resource "random_pet" "this" {
  prefix = var.prefix
  length = 3
}

# This resource explodes on destroy..
resource "tfcoremock_simple_resource" "da_bomb" {
  id = "fail_on_delete"
  string = random_pet.this.id
}
