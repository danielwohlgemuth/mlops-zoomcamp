output "database_endpoint" {
  value       = module.database.database_endpoint
  description = "Database Endpoint (address:port)"
}

output "server_ip" {
  value       = module.server.server_ip
  description = "MLOps Server IP"
}

output "s3_name" {
  value       = module.storage.s3_name
  description = "MLOps Artifacts S3 Name"
}
