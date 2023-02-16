variable "aws_region" {
  type    = string
  default = "us-west-2"
}

variable "aws_profile" {
  type    = string
  default = "default"
}

variable "indent_webhook_secret" {
  type      = string
  sensitive = true
}

variable "default_user_pw" {
  type      = string
  default   = ""
  sensitive = true
}

variable "indent_aws_direct_assignment" {
  type      = string
  default   = ""
  sensitive = true
}

variable "aws_sts_assume_role" {
  type      = string
  default   = ""
  sensitive = true
}

variable "aws_sts_external_id" {
  type      = string
  default   = ""
  sensitive = true
}

