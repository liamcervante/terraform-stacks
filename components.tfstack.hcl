
required_providers {
  tfcoremock = {
    source = "hashicorp/tfcoremock"
    version = "0.4.0"
  }
}

provider "tfcoremock" "main" {}

component "main" {
    source = "./main"
    
    providers = {
        tfcoremock = provider.tfcoremock.main
    }
}
