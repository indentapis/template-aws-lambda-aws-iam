terraform {
  backend "s3" {
    encrypt = true
    bucket  = ""
    region  = "us-west-2"
    key     = "indent/terraform.tfstate"
  }

}

# Indent + AWS IAM Integration

# Details: https://github.com/indentapis/integrations/tree/4cd49f61953ba55c288b41860c4d4c51eb5e2c61/packages/beta/indent-integration-aws-iam
# Last Change: https://github.com/indentapis/integrations/commit/4cd49f61953ba55c288b41860c4d4c51eb5e2c61

module "idt-aws-iam-webhook" {
  source                = "git::https://github.com/indentapis/integrations//terraform/modules/indent_runtime_aws_lambda"
  name                  = "idt-aws-iam-webhook"
  indent_webhook_secret = var.indent_webhook_secret
  artifact = {
    bucket       = "indent-artifacts-us-west-2"
    function_key = "webhooks/aws/lambda/aws-iam-4cd49f61953ba55c288b41860c4d4c51eb5e2c61-function.zip"
    deps_key     = "webhooks/aws/lambda/aws-iam-4cd49f61953ba55c288b41860c4d4c51eb5e2c61-deps.zip"
  }
  env = {
    DEFAULT_USER_PW = var.default_user_pw
  }
}

