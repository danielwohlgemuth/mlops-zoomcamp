variable "db_engine" {
  type        = string
  description = "Database Engine"
}

variable "db_engine_version" {
  type        = string
  description = "Database Engine Version"
}

variable "db_storage" {
  type        = number
  description = "Database Storage Space"
  default     = 10
}

variable "db_instance_class" {
  type        = string
  description = "Database Instance Class"
}

variable "db_username" {
  type        = string
  description = "Database Username"
}

variable "db_password" {
  type        = string
  description = "Database Password"
  sensitive   = true
}

variable "vpc_subnet_id_1" {
  type        = string
  description = "VPC Subnet Id"
}

variable "vpc_subnet_id_2" {
  type        = string
  description = "VPC Subnet Id"
}

variable "security_group_id" {
  type        = string
  description = "Security Group Id"
}
