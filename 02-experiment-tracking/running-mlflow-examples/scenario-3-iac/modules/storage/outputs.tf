output "s3_arn" {
  value       = aws_s3_bucket.mlops.arn
  description = "MLOps Artifacts S3 ARN"
}

output "s3_name" {
  value       = aws_s3_bucket.mlops.bucket
  description = "MLOps Artifacts S3 Name"
}