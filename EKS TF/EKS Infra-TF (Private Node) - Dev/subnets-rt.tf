resource "aws_route_table" "eks-vpc-pub-sub-rt" {
  vpc_id = aws_vpc.eks-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks-igw.id
  }

  tags = {
    Name = "eks-${var.env}-vpc-pub-sub-rt"
  }
}

resource "aws_route_table" "eks-vpc-priv-sub1-rt" {
  vpc_id = aws_vpc.eks-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.eks-nat1-gw.id
  }

  tags = {
    Name = "eks-${var.env}-vpc-priv-sub1-rt"
  }
}

resource "aws_route_table" "eks-vpc-priv-sub2-rt" {
  vpc_id = aws_vpc.eks-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.eks-nat2-gw.id
  }

  tags = {
    Name = "eks-${var.env}-vpc-priv-sub2-rt"
  }
}