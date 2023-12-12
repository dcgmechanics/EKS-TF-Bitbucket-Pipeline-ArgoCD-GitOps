output "aws_region" {
  description = "AWS Prod Region"
  value       = var.region
}

output "aws_vpc" {
  description = "EKS Prod VPC ID"
  value       = aws_vpc.eks-vpc.id
}