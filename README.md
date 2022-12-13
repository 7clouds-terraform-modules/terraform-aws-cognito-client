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

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cognito_user_pool_client.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool_client) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ACCESS_TOKEN_VALIDITY"></a> [ACCESS\_TOKEN\_VALIDITY](#input\_ACCESS\_TOKEN\_VALIDITY) | Time limit, between 5 minutes and 1 day, after which the access token is no longer valid and cannot be used. This value will be overridden if you have entered a value in token\_validity\_units | `number` | `null` | no |
| <a name="input_ALLOWED_OAUTH_FLOWS"></a> [ALLOWED\_OAUTH\_FLOWS](#input\_ALLOWED\_OAUTH\_FLOWS) | List of allowed OAuth flows (code, implicit, client\_credentials) | `set(string)` | `null` | no |
| <a name="input_ALLOWED_OAUTH_FLOWS_USER_POOL_CLIENT"></a> [ALLOWED\_OAUTH\_FLOWS\_USER\_POOL\_CLIENT](#input\_ALLOWED\_OAUTH\_FLOWS\_USER\_POOL\_CLIENT) | Whether the client is allowed to follow the OAuth protocol when interacting with Cognito user pools | `bool` | `null` | no |
| <a name="input_ALLOWED_OAUTH_SCOPES"></a> [ALLOWED\_OAUTH\_SCOPES](#input\_ALLOWED\_OAUTH\_SCOPES) | List of allowed OAuth scopes (phone, email, openid, profile, and aws.cognito.signin.user.admin) | `set(string)` | `null` | no |
| <a name="input_ANALYTICS_CONFIGURATION_BLOCK"></a> [ANALYTICS\_CONFIGURATION\_BLOCK](#input\_ANALYTICS\_CONFIGURATION\_BLOCK) | Configuration block for Amazon Pinpoint analytics for collecting metrics for this user pool | <pre>set(object({<br>    application_arn  = string<br>    application_id   = string<br>    external_id      = string<br>    role_arn         = string<br>    user_data_shared = bool<br>  }))</pre> | `[]` | no |
| <a name="input_AUTH_SESSION_VALIDITY"></a> [AUTH\_SESSION\_VALIDITY](#input\_AUTH\_SESSION\_VALIDITY) | Amazon Cognito creates a session token for each API request in an authentication flow. AuthSessionValidity is the duration, in minutes, of that session token. Your user pool native user must respond to each authentication challenge before the session expires. Valid values between 3 and 15. Default value is 3 | `number` | `null` | no |
| <a name="input_CALLBACK_URLS"></a> [CALLBACK\_URLS](#input\_CALLBACK\_URLS) | List of allowed callback URLs for the identity providers | `set(string)` | <pre>[<br>  "https://localhost:5000/callback",<br>  "https://localhost:5000/callback2"<br>]</pre> | no |
| <a name="input_CLIENT_NAME"></a> [CLIENT\_NAME](#input\_CLIENT\_NAME) | Name of the application client | `string` | n/a | yes |
| <a name="input_DEFAULT_REDIRECT_URI"></a> [DEFAULT\_REDIRECT\_URI](#input\_DEFAULT\_REDIRECT\_URI) | Default redirect URI. Must be in the list of callback URLs | `string` | `null` | no |
| <a name="input_ENABLE_PROPAGATE_ADDITIONAL_USER_CONTEXT_DATA"></a> [ENABLE\_PROPAGATE\_ADDITIONAL\_USER\_CONTEXT\_DATA](#input\_ENABLE\_PROPAGATE\_ADDITIONAL\_USER\_CONTEXT\_DATA) | Activates the propagation of additional user context data | `bool` | `null` | no |
| <a name="input_ENABLE_TOKEN_REVOCATION"></a> [ENABLE\_TOKEN\_REVOCATION](#input\_ENABLE\_TOKEN\_REVOCATION) | Enables or disables token revocation | `bool` | `null` | no |
| <a name="input_EXPLICIT_AUTH_FLOWS"></a> [EXPLICIT\_AUTH\_FLOWS](#input\_EXPLICIT\_AUTH\_FLOWS) | List of authentication flows (ADMIN\_NO\_SRP\_AUTH, CUSTOM\_AUTH\_FLOW\_ONLY, USER\_PASSWORD\_AUTH, ALLOW\_ADMIN\_USER\_PASSWORD\_AUTH, ALLOW\_CUSTOM\_AUTH, ALLOW\_USER\_PASSWORD\_AUTH, ALLOW\_USER\_SRP\_AUTH, ALLOW\_REFRESH\_TOKEN\_AUTH) | `set(string)` | `null` | no |
| <a name="input_GENERATE_SECRET"></a> [GENERATE\_SECRET](#input\_GENERATE\_SECRET) | Should an application secret be generated | `bool` | `null` | no |
| <a name="input_ID_TOKEN_VALIDITY"></a> [ID\_TOKEN\_VALIDITY](#input\_ID\_TOKEN\_VALIDITY) | Time limit, between 5 minutes and 1 day, after which the ID token is no longer valid and cannot be used. This value will be overridden if you have entered a value in token\_validity\_units | `number` | `null` | no |
| <a name="input_LOGOUT_URLS"></a> [LOGOUT\_URLS](#input\_LOGOUT\_URLS) | List of allowed logout URLs for the identity providers | `set(string)` | `null` | no |
| <a name="input_PREVENT_USER_EXISTENCE_ERRORS"></a> [PREVENT\_USER\_EXISTENCE\_ERRORS](#input\_PREVENT\_USER\_EXISTENCE\_ERRORS) | When set to 'ENABLED' and the user does not exist, authentication returns an error indicating either the username or password was incorrect, and account confirmation and password recovery return a response indicating a code was sent to a simulated destination. When set to 'LEGACY', those APIs will return a UserNotFoundException exception if the user does not exist in the user pool | `string` | `null` | no |
| <a name="input_READ_ATTRIBUTES"></a> [READ\_ATTRIBUTES](#input\_READ\_ATTRIBUTES) | List of user pool attributes the application client can read from | `set(string)` | `null` | no |
| <a name="input_REFRESH_TOKEN_VALIDITY"></a> [REFRESH\_TOKEN\_VALIDITY](#input\_REFRESH\_TOKEN\_VALIDITY) | Time limit in days refresh tokens are valid for | `number` | `null` | no |
| <a name="input_SUPPORTED_IDENTITY_PROVIDERS"></a> [SUPPORTED\_IDENTITY\_PROVIDERS](#input\_SUPPORTED\_IDENTITY\_PROVIDERS) | List of provider names for the identity providers that are supported on this client. Uses the provider\_name attribute of aws\_cognito\_identity\_provider resource(s), or the equivalent string(s) | `set(string)` | `null` | no |
| <a name="input_TOKEN_VALIDITY_UNITS_BLOCK"></a> [TOKEN\_VALIDITY\_UNITS\_BLOCK](#input\_TOKEN\_VALIDITY\_UNITS\_BLOCK) | Configuration block for units in which the validity times are represented in. Valid values for the following arguments are: seconds, minutes, hours or days | <pre>set(object({<br>    access_token  = string<br>    id_token      = string<br>    refresh_token = string<br>  }))</pre> | `[]` | no |
| <a name="input_USER_POOL_ID"></a> [USER\_POOL\_ID](#input\_USER\_POOL\_ID) | User pool the client belongs to | `string` | n/a | yes |
| <a name="input_WRITE_ATTRIBUTES"></a> [WRITE\_ATTRIBUTES](#input\_WRITE\_ATTRIBUTES) | List of user pool attributes the application client can write to | `set(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_CLIENT_CALLBACK_URLS"></a> [CLIENT\_CALLBACK\_URLS](#output\_CLIENT\_CALLBACK\_URLS) | n/a |
| <a name="output_CLIENT_ID"></a> [CLIENT\_ID](#output\_CLIENT\_ID) | n/a |
| <a name="output_CLIENT_LOGOUT_URL"></a> [CLIENT\_LOGOUT\_URL](#output\_CLIENT\_LOGOUT\_URL) | n/a |
| <a name="output_CLIENT_NAME"></a> [CLIENT\_NAME](#output\_CLIENT\_NAME) | n/a |
| <a name="output_CLIENT_SECRET"></a> [CLIENT\_SECRET](#output\_CLIENT\_SECRET) | n/a |
<!-- END_TF_DOCS -->