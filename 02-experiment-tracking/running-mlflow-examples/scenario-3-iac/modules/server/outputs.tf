output "server_ip" {
  value       = aws_instance.mlops.public_ip
  description = "MLOps Server IP"
}