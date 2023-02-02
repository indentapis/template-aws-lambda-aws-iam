terraform {
  backend "s3" {
    encrypt = true
    bucket  = ""
    region  = "us-west-2"
    key     = "indent/terraform.tfstate"
  }

}

# Indent + AWS IAM Integration

# Details: https://github.com/indentapis/integrations/tree/d98c51b8e64da2a3cdd3ffda3d6d91b617bc9da0/packages/beta/indent-integration-aws-iam
# Last Change: https://github.com/indentapis/integrations/commit/d98c51b8e64da2a3cdd3ffda3d6d91b617bc9da0

module "idt-aws-iam-webhook" {
  source                = "git::https://github.com/indentapis/integrations//terraform/modules/indent_runtime_aws_lambda"
  name                  = "idt-aws-iam-webhook"
  indent_webhook_secret = var.indent_webhook_secret
  artifact = {
    bucket       = "indent-artifacts-us-west-2"
    function_key = "webhooks/aws/lambda/aws-iam-d98c51b8e64da2a3cdd3ffda3d6d91b617bc9da0-function.zip"
    deps_key     = "webhooks/aws/lambda/aws-iam-d98c51b8e64da2a3cdd3ffda3d6d91b617bc9da0-deps.zip"
  }
  env = {
    DEFAULT_USER_PW = var.default_user_pw
  }
}

