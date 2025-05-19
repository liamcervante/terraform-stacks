
variable "input" {
  type = string

  validation {
    condition = var.input == "hello"
    error_message = "bad input"
  }
}

resource "tfcoremock_simple_resource" "resource" {
    string = var.input
}
