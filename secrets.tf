# This file creates secrets in the AWS Secret Manager
# Note that this does not contain any actual secret values
# make sure to not commit any secret values to git!
# you could put them in secrets.tfvars which is in .gitignore


resource "aws_secretsmanager_secret" "api_key_secret" {
  name = "api-key"
}


resource "aws_secretsmanager_secret_version" "api_keys_value" {
  secret_id     = aws_secretsmanager_secret.api_key_secret.id
  secret_string = var.api-key
}

output "api_key_secret_arn" {
  value = aws_secretsmanager_secret_version.api_keys_value.arn
}
