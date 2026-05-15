variable "aws_profile" {
  type        = string
  description = "AWS CLI Profile"
}

variable "environment" {
  type        = string
  description = "Environment (prod/dev)"
}

variable "project" {
  type        = string
  description = "Project Name"
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

variable "my_ip_v4" {
  type        = string
  description = "My IPv4"
  nullable    = true
  default     = null
}

variable "name" {
  type        = string
  description = "Default Resouce Name"
  default     = "mlops"
}

variable "server_ami_id" {
  type        = string
  description = "Server AMI Id"
}

variable "db_name" {
  type        = string
  description = "Database Name"
}

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