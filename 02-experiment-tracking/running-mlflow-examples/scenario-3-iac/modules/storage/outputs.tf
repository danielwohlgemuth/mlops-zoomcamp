output "s3_arn" {
  value       = aws_s3_bucket.mlops.arn
  description = "MLOps Artifacts S3 ARN"
}