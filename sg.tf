resource "aws_vpc" "sf-vpc" {
  cidr_block       = "0.0.0.0/16"
   tags = {
    Name = "sf-vpc-04"
  }
}
