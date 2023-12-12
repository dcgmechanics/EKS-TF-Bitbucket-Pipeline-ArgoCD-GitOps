resource "aws_iam_role" "eks-nodes-general-role" {
  name = "eks-${var.env}-nodes-general-role"

  assume_role_policy = <<POLICY
  {
    "Version" : "2012-10-17",
    "Statement" : [
        {
            "Effect" : "Allow",
            "Principal" : {
                "Service" : "ec2.amazonaws.com"
            },
            "Action" : "sts:AssumeRole"
        }
    ]
  }
  POLICY
}

resource "aws_iam_role_policy_attachment" "eks-worker-node-policy-general" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks-nodes-general-role.name
}

resource "aws_iam_role_policy_attachment" "eks-cni-policy-general" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks-nodes-general-role.name
}

resource "aws_iam_role_policy_attachment" "eks-ec2-container-registry-read-only" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks-nodes-general-role.name
}

resource "aws_eks_node_group" "eks-nodes-general" {
  cluster_name    = aws_eks_cluster.eks-cluster.name
  node_group_name = "eks-${var.env}-nodes"
  node_role_arn   = aws_iam_role.eks-nodes-general-role.arn

  subnet_ids = [
    aws_subnet.eks-vpc-pub-sub1.id,
    aws_subnet.eks-vpc-pub-sub2.id
  ]

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 1
  }

  ami_type             = "AL2_x86_64"
  capacity_type        = "ON_DEMAND"
  disk_size            = 30
  force_update_version = false
  instance_types       = ["c7i.xlarge"]
  
  tags_all = {
    Name = "eks-${var.env}-node"
    }

  labels = {
    role = "eks-nodes"
  }

  version = var.k8s-ver #K8s Version

  depends_on = [
    aws_iam_role_policy_attachment.eks-worker-node-policy-general,
    aws_iam_role_policy_attachment.eks-cni-policy-general,
    aws_iam_role_policy_attachment.eks-ec2-container-registry-read-only
  ]
}