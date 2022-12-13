module "cognito_user_pool_client" {
  source       = "../.."
  USER_POOL_ID = "valid_user_pool_id"
  CLIENT_NAME  = "example"
  # For using analytics you must create or reference an exsting aws_pinpoint_app
  ANALYTICS_CONFIGURATION_BLOCK = [{
    application_arn  = null # CONFLICTS WITH EXTERNAL_ID AND ROLE_ARN
    application_id   = "place_your_aws_pinpoint_id_here"
    external_id      = "some_id"
    role_arn         = "place_your_role_arn_here"
    user_data_shared = true
  }]
}
