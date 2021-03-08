resource "aws_vpc" "MyVPC" {
  cidr_block = "19.19.0.0/24"

  tags = {
    Name = "MyVPC"
  }
}