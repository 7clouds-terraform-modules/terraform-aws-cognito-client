module "cognito_user_pool_client" {
  source = "./cognito_user_pool_client"
  USER_POOL_ID = module.cognito_user_pool.USER_POOL_ID
  CLIENT_NAME  = "example"
}