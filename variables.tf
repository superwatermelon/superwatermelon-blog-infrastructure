variable "artifact_bucket_name" {
  description = "The name to give the artifact S3 bucket"
  type        = "string"
}

variable "vpc_id" {
  description = "The VPC into which to create resources"
  type        = "string"
}

variable "asg_id" {
  description = "The Auto-Scaling Group that will host the blog app"
  type        = "string"
}

variable "http_listener_arn" {
  description = "The ALB listener for HTTP traffic"
  type        = "string"
}

variable "https_listener_arn" {
  description = "The ALB listener for HTTPS traffic"
  type        = "string"
}

variable "host" {
  description = "The domain name hosting the blog"
  type        = "string"
}
