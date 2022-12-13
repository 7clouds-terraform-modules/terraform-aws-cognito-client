module "cognito_user_pool_client" {
  source       = "../.."
  USER_POOL_ID = "valid_user_pool_id"
  CLIENT_NAME  = "example"
  GENERATE_SECRET = true
  EXPLICIT_AUTH_FLOWS = ["ADMIN_NO_SRP_AUTH"]
}
