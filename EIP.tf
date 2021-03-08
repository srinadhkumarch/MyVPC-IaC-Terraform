resource "aws_eip" "MyVPC_EIP" {
  vpc        = true
  depends_on = [aws_internet_gateway.IGW]
  tags = {
    Name = "MyVPC-EIP"
  }
}