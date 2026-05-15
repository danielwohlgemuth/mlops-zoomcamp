output "database_endpoint" {
  value       = aws_db_instance.mlops.endpoint
  description = "Database Endpoint (address:port)"
}
