
module "aws_cognito" {

  source  = "lgallard/cognito-user-pool/aws"
  version = "0.23.0"

  user_pool_name = local.tenant_name

  clients = [
    {
      allowed_oauth_flows                  = ["code"]
      allowed_oauth_flows_user_pool_client = true
      allowed_oauth_scopes                 = ["email", "openid", "profile"]
      callback_urls                        = ["https://application-${local.tenant_name}${local.app_base_domain}/login/oauth2/code/cognito"]
      default_redirect_uri                 = "https://application-${local.tenant_name}${local.app_base_domain}/login/oauth2/code/cognito"
      explicit_auth_flows                  = []
      generate_secret                      = true
      logout_urls                          = []
      name                                 = "app"
      read_attributes                      = ["email"]
      supported_identity_providers         = ["COGNITO"]
      write_attributes                     = []
      access_token_validity                = 1
      id_token_validity                    = 1
      refresh_token_validity               = 60
      token_validity_units = {
        access_token  = "hours"
        id_token      = "hours"
        refresh_token = "days"
      }
    }
  ]

  # we need this to be unique across all Duplo environments 
  domain = replace(replace("${local.tenant_name}${local.app_base_domain}", "-", ""), ".", "")

  tags = {
    TENANT_NAME   = local.tenant_name
    duplo-project = local.tenant_name
    DUPLO_TENANT  = local.tenant_name
  }
}

resource "aws_cognito_user" "user1" {
  user_pool_id = module.aws_cognito.id
  username     = "user1"
  password     = var.congito_user_default_password

  attributes = {
    email          = "user1@example.com"
    email_verified = true
  }
}

resource "aws_cognito_user" "user2" {
  user_pool_id = module.aws_cognito.id
  username     = "user2"
  password     = var.congito_user_default_password

  attributes = {
    email          = "user2@example.com"
    email_verified = true
  }
}

resource "aws_cognito_user" "user3" {
  user_pool_id = module.aws_cognito.id
  username     = "user3"
  password     = var.congito_user_default_password

  attributes = {
    email          = "user3@example.com"
    email_verified = true
  }
}

data "aws_iam_policy_document" "cognito-persmissions" {
  statement {
    actions = [
      "cognito-identity:*",
      "cognito-idp:*",
      "cognito-sync:*"
    ]

    resources = [
      "*",
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:ResourceTag/TENANT_NAME"

      values = [
        local.tenant_name
      ]
    }
  }

  statement {
    actions = [
      "cognito-idp:ListUserPools",
      "cognito-identity:ListIdentityPools"
    ]
    resources = [
      "*",
    ]
  }
}

module "tenant-role" {
  source          = "git@github.com:duplocloud/terraform-duplocloud-components//modules/tenant-role-extension?ref=8790efc5e7e37cd704ef65792bba53e9d96a218e"
  tenant_name     = local.tenant_name
  policy_name     = "cognito-access"
  iam_policy_json = data.aws_iam_policy_document.cognito-persmissions.json
}
