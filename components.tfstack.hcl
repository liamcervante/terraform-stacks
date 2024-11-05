required_providers {
    tfcoremock = {
        source = "hashicorp/tfcoremock"
        version = "0.3.0"
    }
}

provider "tfcoremock" "main" {}

component "one" {
    source = "app.terraform.io/liamcervante/simple/module"
    version = "0.2.0"
    providers = {
        tfcoremock = provider.tfcoremock.main
    }
}
