resource "aws_route_table" "Publicroute" {
  vpc_id = aws_vpc.MyVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id      = aws_internet_gateway.IGW.id
  }

  tags = {
    Name = "MyVPC-PublicRoute"
  }
}

resource "aws_route_table" "Privateroute" {
  vpc_id = aws_vpc.MyVPC.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NATG.id
  }

  tags = {
    Name = "MyVPC-PrivateRoute"
  }
}

resource "aws_route_table_association" "Private" {
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.Privateroute.id
  count          = 3
  depends_on     = [aws_subnet.private_subnet]
}

resource "aws_route_table_association" "Public" {
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.Publicroute.id
  count          = 3
  depends_on     = [aws_subnet.public_subnet]
}

resource "aws_main_route_table_association" "Main_route" {
  vpc_id         = aws_vpc.MyVPC.id
  route_table_id = aws_route_table.Publicroute.id
}