output "idt-aws-iam-webhook-url" {
  value       = module.idt-aws-iam-webhook.function_url
  description = "The URL of the deployed Lambda"
}

