# REQUIRED
variable "CLIENT_NAME" {
  description = "Name of the application client"
  type        = string
}

variable "USER_POOL_ID" {
  description = "User pool the client belongs to"
  type        = string
}

# OPTIONAL
variable "ACCESS_TOKEN_VALIDITY" {
  description = "Time limit, between 5 minutes and 1 day, after which the access token is no longer valid and cannot be used. This value will be overridden if you have entered a value in token_validity_units"
  type        = number
  default     = null
}

variable "ALLOWED_OAUTH_FLOWS_USER_POOL_CLIENT" {
  description = "Whether the client is allowed to follow the OAuth protocol when interacting with Cognito user pools"
  type        = bool
  default     = null
}

variable "ALLOWED_OAUTH_FLOWS" {
  description = "List of allowed OAuth flows (code, implicit, client_credentials)"
  type        = set(string)
  default     = null
}

variable "ALLOWED_OAUTH_SCOPES" {
  description = "List of allowed OAuth scopes (phone, email, openid, profile, and aws.cognito.signin.user.admin)"
  type        = set(string)
  default     = null
}

variable "ANALYTICS_CONFIGURATION_BLOCK" {
  description = "Configuration block for Amazon Pinpoint analytics for collecting metrics for this user pool"
  type = set(object({
    application_arn  = string
    application_id   = string
    external_id      = string
    role_arn         = string
    user_data_shared = bool
  }))
  default = []
}

variable "AUTH_SESSION_VALIDITY" {
  description = "Amazon Cognito creates a session token for each API request in an authentication flow. AuthSessionValidity is the duration, in minutes, of that session token. Your user pool native user must respond to each authentication challenge before the session expires. Valid values between 3 and 15. Default value is 3"
  type        = number
  default     = null
}

variable "CALLBACK_URLS" {
  description = "List of allowed callback URLs for the identity providers"
  type        = set(string)
  default     = ["https://localhost:5000/callback", "https://localhost:5000/callback2"]
}

variable "DEFAULT_REDIRECT_URI" {
  description = "Default redirect URI. Must be in the list of callback URLs"
  type        = string
  default     = null
}

variable "ENABLE_TOKEN_REVOCATION" {
  description = "Enables or disables token revocation"
  type        = bool
  default     = null
}

variable "ENABLE_PROPAGATE_ADDITIONAL_USER_CONTEXT_DATA" {
  description = "Activates the propagation of additional user context data"
  type        = bool
  default     = null
}

variable "EXPLICIT_AUTH_FLOWS" {
  description = "List of authentication flows (ADMIN_NO_SRP_AUTH, CUSTOM_AUTH_FLOW_ONLY, USER_PASSWORD_AUTH, ALLOW_ADMIN_USER_PASSWORD_AUTH, ALLOW_CUSTOM_AUTH, ALLOW_USER_PASSWORD_AUTH, ALLOW_USER_SRP_AUTH, ALLOW_REFRESH_TOKEN_AUTH)"
  type        = set(string)
  default     = null
}

variable "GENERATE_SECRET" {
  description = "Should an application secret be generated"
  type        = bool
  default     = null
}

variable "ID_TOKEN_VALIDITY" {
  description = "Time limit, between 5 minutes and 1 day, after which the ID token is no longer valid and cannot be used. This value will be overridden if you have entered a value in token_validity_units"
  type        = number
  default     = null
}

variable "LOGOUT_URLS" {
  description = "List of allowed logout URLs for the identity providers"
  type        = set(string)
  default     = null
}

variable "PREVENT_USER_EXISTENCE_ERRORS" {
  description = "When set to 'ENABLED' and the user does not exist, authentication returns an error indicating either the username or password was incorrect, and account confirmation and password recovery return a response indicating a code was sent to a simulated destination. When set to 'LEGACY', those APIs will return a UserNotFoundException exception if the user does not exist in the user pool"
  type        = string
  default     = null
}

variable "READ_ATTRIBUTES" {
  description = "List of user pool attributes the application client can read from"
  type        = set(string)
  default     = null
}
variable "WRITE_ATTRIBUTES" {
  description = "List of user pool attributes the application client can write to"
  type        = set(string)
  default     = null
}

variable "REFRESH_TOKEN_VALIDITY" {
  description = "Time limit in days refresh tokens are valid for"
  type        = number
  default     = null
}

variable "SUPPORTED_IDENTITY_PROVIDERS" {
  description = "List of provider names for the identity providers that are supported on this client. Uses the provider_name attribute of aws_cognito_identity_provider resource(s), or the equivalent string(s)"
  type        = set(string)
  default     = null
}

variable "TOKEN_VALIDITY_UNITS_BLOCK" {
  description = "Configuration block for units in which the validity times are represented in. Valid values for the following arguments are: seconds, minutes, hours or days"
  type = set(object({
    access_token  = string
    id_token      = string
    refresh_token = string
  }))
  default = []
}
