terraform {
  backend "s3" {
    encrypt = true
    bucket  = ""
    region  = "us-west-2"
    key     = "indent/terraform.tfstate"
  }

}

# Indent + AWS IAM Integration

# Details: https://github.com/indentapis/integrations/tree/6406a535ce599285503cc04e01d37c5ff25d34ce/packages/beta/indent-integration-aws-iam
# Last Change: https://github.com/indentapis/integrations/commit/6406a535ce599285503cc04e01d37c5ff25d34ce

module "idt-aws-iam-webhook" {
  source                = "git::https://github.com/indentapis/integrations//terraform/modules/indent_runtime_aws_lambda"
  name                  = "idt-aws-iam-webhook"
  indent_webhook_secret = var.indent_webhook_secret
  artifact = {
    bucket       = "indent-artifacts-us-west-2"
    function_key = "webhooks/aws/lambda/aws-iam-6406a535ce599285503cc04e01d37c5ff25d34ce-function.zip"
    deps_key     = "webhooks/aws/lambda/aws-iam-6406a535ce599285503cc04e01d37c5ff25d34ce-deps.zip"
  }
  env = {
    DEFAULT_USER_PW = var.default_user_pw
  }
}

