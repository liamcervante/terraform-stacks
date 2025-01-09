terraform {
  required_providers {
    tfcoremock = {
      source  = "hashicorp/tfcoremock"
      version = "0.4.0"
    }
  }
}

variable "value" {
    type = string
}

resource "tfcoremock_simple_resource" "resource" {
    id = var.value
}
