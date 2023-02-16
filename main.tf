terraform {
  backend "s3" {
    encrypt = true
    bucket  = ""
    region  = "us-west-2"
    key     = "indent/terraform.tfstate"
  }

}

# Indent + AWS IAM Integration

# Details: https://github.com/indentapis/integrations/tree/1276a93f9efa0874eb912f268611afe92d419cee/packages/beta/indent-integration-aws-iam
# Last Change: https://github.com/indentapis/integrations/commit/1276a93f9efa0874eb912f268611afe92d419cee

module "idt-aws-iam-webhook" {
  source                = "git::https://github.com/indentapis/integrations//terraform/modules/indent_runtime_aws_lambda"
  name                  = "idt-aws-iam-webhook"
  indent_webhook_secret = var.indent_webhook_secret
  artifact = {
    bucket       = "indent-artifacts-us-west-2"
    function_key = "webhooks/aws/lambda/aws-iam-1276a93f9efa0874eb912f268611afe92d419cee-function.zip"
    deps_key     = "webhooks/aws/lambda/aws-iam-1276a93f9efa0874eb912f268611afe92d419cee-deps.zip"
  }
  env = {
    DEFAULT_USER_PW              = var.default_user_pw
    INDENT_AWS_DIRECT_ASSIGNMENT = var.indent_aws_direct_assignment
    AWS_STS_ASSUME_ROLE          = var.aws_sts_assume_role
    AWS_STS_EXTERNAL_ID          = var.aws_sts_external_id
  }
}

