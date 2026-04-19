variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "my_ip_v4" {
  type        = string
  description = "My IPv4"
  nullable    = true
  default     = null
}