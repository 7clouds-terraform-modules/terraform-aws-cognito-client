# Cognito User Pool Client Module by 7Clouds

Thank you for riding with us! Feel free to download or reference this respository in your terraform projects and studies

This module is a part of our product SCA — An automated API and Serverless Infrastructure generator that can reduce your API development time by 40-60% and automate your deployments up to 90%! Check it out at <https://seventechnologies.cloud>

Please rank this repo 5 starts if you like our job!

## Usage

The module deploys a cognito user pool client. It's possible to set a full configuration (attention to the possible conflicts) and also the basic one, only passing the required variables.

## Example

```hcl
module "cognito_user_pool_client" {
  source = "./"
  USER_POOL_ID = module.cognito_user_pool.USER_POOL_ID
  CLIENT_NAME  = "example"
}
```
