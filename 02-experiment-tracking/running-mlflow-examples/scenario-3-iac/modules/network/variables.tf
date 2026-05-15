variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "name" {
  type        = string
  description = "Default Resouce Name"
}

variable "my_ip_v4" {
  type        = string
  description = "My IPv4"
  nullable    = true
  default     = null
}

variable "s3_arn" {
  type        = string
  description = "MLOps Artifacts S3 ARN"
}