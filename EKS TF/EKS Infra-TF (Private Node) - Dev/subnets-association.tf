resource "aws_route_table_association" "eks-vpc-pub-sub1-rt-association" {
  subnet_id      = aws_subnet.eks-vpc-pub-sub1.id
  route_table_id = aws_route_table.eks-vpc-pub-sub-rt.id
}

resource "aws_route_table_association" "eks-vpc-pub-sub2-rt-association" {
  subnet_id      = aws_subnet.eks-vpc-pub-sub2.id
  route_table_id = aws_route_table.eks-vpc-pub-sub-rt.id
}

resource "aws_route_table_association" "eks-vpc-priv-sub1-rt-association" {
  subnet_id      = aws_subnet.eks-vpc-priv-sub1.id
  route_table_id = aws_route_table.eks-vpc-priv-sub1-rt.id
}

resource "aws_route_table_association" "eks-vpc-priv-sub2-rt-association" {
  subnet_id      = aws_subnet.eks-vpc-priv-sub2.id
  route_table_id = aws_route_table.eks-vpc-priv-sub2-rt.id
}