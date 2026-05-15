output "vpc_endpoint_id" {
  value       = aws_vpc_endpoint.mlops.id
  description = "VPC Endpoint ID"
}

output "vpc_subnet_id_1" {
  value       = aws_subnet.mlops_1.id
  description = "VPC Subnet ID"
}

output "vpc_subnet_id_2" {
  value       = aws_subnet.mlops_2.id
  description = "VPC Subnet ID"
}

output "security_group_id" {
  value       = aws_vpc.mlops.default_security_group_id
  description = "Security Group ID"
}