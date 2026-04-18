variable "aws_profile" {
  type        = string
  description = "AWS CLI Profile"
}

variable "environment" {
  type        = string
  description = "Environment (prod/dev)"
}

variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "terraform_state_bucket" {
  type        = string
  description = "Terraform State Bucket"
  #sensitive   = true
  #ephemeral = true
}

variable "key_pair_name" {
  type        = string
  description = "EC2 Key Pair Name"
}