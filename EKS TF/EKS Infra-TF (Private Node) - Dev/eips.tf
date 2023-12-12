resource "aws_eip" "eks-eip-nat1" {
  depends_on = [aws_internet_gateway.eks-igw]

  tags = {
    Name = "eks-${var.env}-eip-nat1"
  }
}

resource "aws_eip" "eks-eip-nat2" {
  depends_on = [aws_internet_gateway.eks-igw]

  tags = {
    Name = "eks-${var.env}-eip-nat2"
  }
}