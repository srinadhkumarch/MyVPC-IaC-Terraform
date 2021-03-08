variable "VPCTag" {
  default = "MyVPC"
}

variable "AllowIP" {
  default = ["0.0.0.0/0"]
}

variable "Publicsubnet_name" {
  default = ["Public-subnet-2a", "Public-subnet-2b", "Public-subnet-2c"]
}

variable "Publicsubnet_CIDR" {
  default = ["19.19.0.0/27", "19.19.0.32/27", "19.19.0.96/27"]
}

variable "Privatesubnet_name" {
  default = ["Private-subnet-2a", "Private-subnet-2b", "Private-subnet-2c"]
}

variable "Privatesubnet_CIDR" {
  default = ["19.19.0.128/27", "19.19.0.160/27", "19.19.0.192/27"]
}

# Declare the data source
data "aws_availability_zones" "available" {
  state = "available"
}