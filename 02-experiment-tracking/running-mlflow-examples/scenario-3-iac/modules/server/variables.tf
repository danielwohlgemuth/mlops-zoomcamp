variable "key_pair_name" {
  type        = string
  description = "EC2 Key Pair Name"
}

variable "vpc_endpoint_id" {
  type        = string
  description = "VPC Endpoint Id"
}

variable "vpc_subnet_id" {
  type        = string
  description = "VPC Subnet Id"
}

variable "security_group_id" {
  type        = string
  description = "Security Group Id"
}
