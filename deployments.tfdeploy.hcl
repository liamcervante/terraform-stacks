
identity_token "aws" {
  audience = ["aws.workload.identity"]
}

deployment "testing" {
    inputs = {
        aws_token = identity_token.aws.jwt
    }
}
