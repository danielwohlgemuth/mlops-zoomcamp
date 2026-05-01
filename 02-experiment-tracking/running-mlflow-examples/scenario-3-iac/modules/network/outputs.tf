output "vpc_endpoint_id" {
  value       = aws_vpc_endpoint.mlops.id
  description = "VPC Endpoint ID"
}

output "vpc_subnet_id" {
  value       = aws_subnet.mlops.id
  description = "VPC Subnet ID"
}

output "security_group_id" {
  value       = aws_vpc.mlops.default_security_group_id
  description = "Security Group ID"
}