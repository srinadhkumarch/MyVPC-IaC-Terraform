resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.MyVPC.id
  cidr_block = var.Publicsubnet_CIDR[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = var.Publicsubnet_name[count.index]
  }
  count      = 3
  depends_on = [aws_vpc.MyVPC]
}