output "aws_region" {
  description = "AWS Dev Region"
  value       = var.region
}

output "aws_vpc" {
  description = "EKS Dev VPC ID"
  value       = aws_vpc.eks-vpc.id
}