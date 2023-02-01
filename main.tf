terraform {
  backend "s3" {
    encrypt = true
    bucket  = ""
    region  = "us-west-2"
    key     = "indent/terraform.tfstate"
  }

}

# Indent + AWS IAM Integration

# Details: https://github.com/indentapis/integrations/tree/eb128de119f3d617bbba1da3e7425ea46ef1213a/packages/beta/indent-integration-aws-iam
# Last Change: https://github.com/indentapis/integrations/commit/eb128de119f3d617bbba1da3e7425ea46ef1213a

module "idt-aws-iam-webhook" {
  source                = "git::https://github.com/indentapis/integrations//terraform/modules/indent_runtime_aws_lambda"
  name                  = "idt-aws-iam-webhook"
  indent_webhook_secret = var.indent_webhook_secret
  artifact = {
    bucket       = "indent-artifacts-us-west-2"
    function_key = "webhooks/aws/lambda/aws-iam-eb128de119f3d617bbba1da3e7425ea46ef1213a-function.zip"
    deps_key     = "webhooks/aws/lambda/aws-iam-eb128de119f3d617bbba1da3e7425ea46ef1213a-deps.zip"
  }
  env = {
    DEFAULT_USER_PW = var.default_user_pw
  }
}

