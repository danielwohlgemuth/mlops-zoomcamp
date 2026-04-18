output "server_ip" {
  value       = aws_instance.mlops_server.public_ip
  description = "MLOps Server IP"
}