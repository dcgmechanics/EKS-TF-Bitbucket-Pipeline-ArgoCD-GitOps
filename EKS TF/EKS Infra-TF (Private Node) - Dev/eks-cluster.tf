resource "aws_eks_cluster" "eks-cluster" {
  name     = "eks-${var.env}-cluster"
  role_arn = aws_iam_role.eks-cluster-iam-role.arn
  version  = var.k8s-ver

  vpc_config {
    endpoint_private_access = false
    endpoint_public_access  = true

    subnet_ids = [
      aws_subnet.eks-vpc-pub-sub1.id,
      aws_subnet.eks-vpc-pub-sub2.id,
      aws_subnet.eks-vpc-priv-sub1.id,
      aws_subnet.eks-vpc-priv-sub2.id
    ]
  }
  depends_on = [
    aws_iam_role_policy_attachment.eks-cluster-iam-policy
  ]
}