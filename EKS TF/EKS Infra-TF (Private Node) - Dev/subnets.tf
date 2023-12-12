resource "aws_subnet" "eks-vpc-pub-sub1" {
  vpc_id     = aws_vpc.eks-vpc.id
  cidr_block = "10.13.0.0/20"

  tags = {
    Name                        = "eks-${var.env}-pub-${var.region}a-sub1"
    "kubernetes.io/cluster/eks-${var.env}-cluster" = "shared"
    "kubernetes.io/role/elb"    = 1
  }

  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "eks-vpc-pub-sub2" {
  vpc_id     = aws_vpc.eks-vpc.id
  cidr_block = "10.13.16.0/20"

  tags = {
    Name                        = "eks-${var.env}-pub-${var.region}b-sub2"
    "kubernetes.io/cluster/eks-${var.env}-cluster" = "shared"
    "kubernetes.io/role/elb"    = 1
  }

  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "eks-vpc-priv-sub1" {
  vpc_id     = aws_vpc.eks-vpc.id
  cidr_block = "10.13.32.0/20"

  tags = {
    Name                              = "eks-${var.env}-priv-${var.region}a-sub1"
    "kubernetes.io/cluster/eks-${var.env}-cluster" = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }

  availability_zone       = "${var.region}a"
}

resource "aws_subnet" "eks-vpc-priv-sub2" {
  vpc_id     = aws_vpc.eks-vpc.id
  cidr_block = "10.13.64.0/20"

  tags = {
    Name                              = "eks-${var.env}-priv-${var.region}b-sub2"
    "kubernetes.io/cluster/eks-${var.env}-cluster" = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }

  availability_zone       = "${var.region}b"
}