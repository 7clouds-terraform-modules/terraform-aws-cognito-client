resource "aws_cognito_user_pool_client" "this" {
  name                                 = var.CLIENT_NAME
  user_pool_id                         = var.USER_POOL_ID
  access_token_validity                = var.ACCESS_TOKEN_VALIDITY
  allowed_oauth_flows_user_pool_client = var.ALLOWED_OAUTH_FLOWS_USER_POOL_CLIENT == null ? null : var.ALLOWED_OAUTH_FLOWS_USER_POOL_CLIENT
  allowed_oauth_flows                  = var.ALLOWED_OAUTH_FLOWS
  allowed_oauth_scopes                 = var.ALLOWED_OAUTH_SCOPES

  dynamic "analytics_configuration" {
    for_each = var.ANALYTICS_CONFIGURATION_BLOCK
    content {
      application_arn  = analytics_configuration.value["application_arn"] == null ? null : analytics_configuration.value["application_arn"]
      application_id   = analytics_configuration.value["application_id"] == null ? null : analytics_configuration.value["application_id"]
      external_id      = analytics_configuration.value["external_id"] == null ? null : analytics_configuration.value["external_id"]
      role_arn         = analytics_configuration.value["role_arn"] == null ? null : analytics_configuration.value["role_arn"]
      user_data_shared = analytics_configuration.value["user_data_shared"] == null ? null : analytics_configuration.value["user_data_shared"]
    }
  }
  auth_session_validity                         = var.AUTH_SESSION_VALIDITY
  callback_urls                                 = var.CALLBACK_URLS
  default_redirect_uri                          = var.DEFAULT_REDIRECT_URI
  enable_token_revocation                       = var.ENABLE_TOKEN_REVOCATION
  enable_propagate_additional_user_context_data = var.ENABLE_PROPAGATE_ADDITIONAL_USER_CONTEXT_DATA
  explicit_auth_flows                           = var.EXPLICIT_AUTH_FLOWS
  generate_secret                               = var.GENERATE_SECRET
  id_token_validity                             = var.ID_TOKEN_VALIDITY
  logout_urls                                   = var.LOGOUT_URLS
  prevent_user_existence_errors                 = var.PREVENT_USER_EXISTENCE_ERRORS
  read_attributes                               = var.READ_ATTRIBUTES
  write_attributes                              = var.WRITE_ATTRIBUTES
  refresh_token_validity                        = var.REFRESH_TOKEN_VALIDITY
  supported_identity_providers                  = var.SUPPORTED_IDENTITY_PROVIDERS

  dynamic "token_validity_units" {
    for_each = var.TOKEN_VALIDITY_UNITS_BLOCK
    content {
      access_token  = token_validity_units.value["access_token"] == null ? null : token_validity_units.value["access_token"]
      id_token      = token_validity_units.value["id_token"] == null ? null : token_validity_units.value["id_token"]
      refresh_token = token_validity_units.value["refresh_token"] == null ? null : token_validity_units.value["refresh_token"]
    }
  }
}
