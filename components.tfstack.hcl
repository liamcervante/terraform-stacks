
required_providers {
  tfcoremock = {
    source = "hashicorp/tfcoremock"
    version = "0.5.0"
  }
}

provider "tfcoremock" "main" {
  config {
    use_only_state = true
  }
}

component "main" {
    source = "./main"

    inputs = {
      input = "wrong"
    }
    
    providers = {
        tfcoremock = provider.tfcoremock.main
    }
}
