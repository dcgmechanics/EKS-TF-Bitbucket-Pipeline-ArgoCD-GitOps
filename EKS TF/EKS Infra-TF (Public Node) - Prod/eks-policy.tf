resource "aws_iam_role" "eks-cluster-iam-role" {
  name = "eks-${var.env}-cluster-iam-role"

  assume_role_policy = <<POLICY
  {
    "Version" : "2012-10-17",
    "Statement" : [
        {
            "Effect" : "Allow",
            "Principal" : {
                "Service" : "eks.amazonaws.com"
            },
            "Action" : "sts:AssumeRole"
        }
    ]
  }
POLICY
}


resource "aws_iam_role_policy_attachment" "eks-cluster-iam-policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks-cluster-iam-role.name
}