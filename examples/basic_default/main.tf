module "cognito_user_pool_client" {
  source       = "../.."
  USER_POOL_ID = "valid_user_pool_id"
  CLIENT_NAME  = "example"
}
