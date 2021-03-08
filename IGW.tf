resource "aws_internet_gateway" "IGW" {
  vpc_id     = aws_vpc.MyVPC.id
  depends_on = [aws_vpc.MyVPC]
}