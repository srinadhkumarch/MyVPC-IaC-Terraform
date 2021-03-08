# Creating NAT Gateway for MyVPC
resource "aws_nat_gateway" "NATG" {
  allocation_id = aws_eip.MyVPC_EIP.id
  subnet_id     = aws_subnet.public_subnet[0].id
  depends_on    = [aws_eip.MyVPC_EIP, aws_subnet.private_subnet]
}