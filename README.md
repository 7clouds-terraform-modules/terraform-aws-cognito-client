# Cognito Client Module by 7Clouds

Thank you for riding with us! Feel free to download or reference this respository in your terraform projects and studies

This module is a part of our product SCA — An automated API and Serverless Infrastructure generator that can reduce your API development time by 40-60% and automate your deployments up to 90%! Check it out at <https://seventechnologies.cloud>

Please rank this repo 5 starts if you like our job!

## Usage

The module deploys a cognito user pool client. It's possible to set a full configuration (attention to the possible conflicts) and also the basic one, only passing the required variables

If you need to use a dynamic block, you must place all the arguments and if you don't need one or some of them, set its/their value(s) as null

## Example

```hcl
module "cognito_user_pool_client" {
  source = "./"

  USER_POOL_ID = module.cognito_user_pool.USER_POOL_ID #We also have other cognito modules available, you might check our repositories for more information
  CLIENT_NAME                  = "example"
  ACCESS_TOKEN_VALIDITY        = 1
  ALLOWED_OAUTH_FLOWS          = ["code", "implicit"]
  ALLOWED_OAUTH_FLOWS_USER_POOL_CLIENT = true
  ALLOWED_OAUTH_SCOPES         = ["email", "phone", "openid"]
  CALLBACK_URLS                = ["https://example.com/callback"]
  LOGOUT_URLS                  = ["https://example.com/logout"]
  SUPPORTED_IDENTITY_PROVIDERS = ["COGNITO"]
  TOKEN_VALIDITY_UNITS_BLOCK   = [ {
    access_token = null
    id_token = "hours"
    refresh_token = "days"
  } ]
}
```
