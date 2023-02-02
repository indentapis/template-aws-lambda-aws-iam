terraform {
  backend "s3" {
    encrypt = true
    bucket  = ""
    region  = "us-west-2"
    key     = "indent/terraform.tfstate"
  }

}

# Indent + AWS IAM Integration

# Details: https://github.com/indentapis/integrations/tree/307965211decafe8b8e91e7001fdc59c9b2e8760/packages/beta/indent-integration-aws-iam
# Last Change: https://github.com/indentapis/integrations/commit/307965211decafe8b8e91e7001fdc59c9b2e8760

module "idt-aws-iam-webhook" {
  source                = "git::https://github.com/indentapis/integrations//terraform/modules/indent_runtime_aws_lambda"
  name                  = "idt-aws-iam-webhook"
  indent_webhook_secret = var.indent_webhook_secret
  artifact = {
    bucket       = "indent-artifacts-us-west-2"
    function_key = "webhooks/aws/lambda/aws-iam-307965211decafe8b8e91e7001fdc59c9b2e8760-function.zip"
    deps_key     = "webhooks/aws/lambda/aws-iam-307965211decafe8b8e91e7001fdc59c9b2e8760-deps.zip"
  }
  env = {
    DEFAULT_USER_PW = var.default_user_pw
  }
}

