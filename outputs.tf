output "CLIENT_ID" {
  value = aws_cognito_user_pool_client.this.id
}

output "CLIENT_NAME" {
  value = aws_cognito_user_pool_client.this.name
}

output "CLIENT_SECRET" {
  value     = aws_cognito_user_pool_client.this.client_secret == null ? null : aws_cognito_user_pool_client.this.client_secret
  sensitive = true
}

output "CLIENT_CALLBACK_URLS" {
  value = aws_cognito_user_pool_client.this.callback_urls[*] == null ? null : aws_cognito_user_pool_client.this.callback_urls[*]
}
