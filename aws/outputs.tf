output "bucket_id" {
  description = "ID of the bucket"
  value       = aws_s3_bucket.bucket_web_teste.id
}

output "bucket_website_domain" {
  description = "Website domain in bucket"
  value       = aws_s3_bucket.bucket_web_teste.website_domain
}

output "bucket_website_endpoint" {
  description = "Website endpoint in bucket"
  value       = aws_s3_bucket.bucket_web_teste.website_endpoint
}


