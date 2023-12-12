resource "aws_eip" "eks-eip-nat" {
  depends_on = [aws_internet_gateway.eks-igw]

  tags = {
    Name = "eks-${var.env}-eip-nat"
  }
}

#resource "aws_eip" "eks-eip-nat2" {
#  depends_on = [aws_internet_gateway.eks-igw]

#  tags = {
#    Name = "eks-${var.env}-eip-nat2"
#  }
#}