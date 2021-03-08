# Creating Security Groups for MyVPC
resource "aws_security_group" "public-security-group" {
  name        = "MyVPC-SG-Public"
  description = "Allow inbound & Outbound traffic for public Subnet "
  vpc_id      = aws_vpc.MyVPC.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.AllowIP
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.AllowIP
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.AllowIP
  }

  tags = {
    application = var.VPCTag
  }
}

resource "aws_security_group" "private-security-group" {
  name        = "MyVPC-SG-Private"
  description = "Allow inbound & Outbound traffic for private Subnet "
  vpc_id      = aws_vpc.MyVPC.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.AllowIP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.AllowIP
  }

  tags = {
    application = var.VPCTag
  }
}
