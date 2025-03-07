
resource "aws_secretsmanager_secret" "secret" {
    name = "deleteme"
}

resource "aws_secretsmanager_secret_version" "version" {
    secret_id = aws_secretsmanager_secret.secret.id
    secret_string = "supersecret"
}
