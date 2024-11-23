provider "aws" {
  region = "us-east-2"

}


provider "aws" {
  alias = "region01"
  region = "us-west-1"

}


provider "aws" {
  alias = "region02"
  region = "us-east-1"

}





data "aws_ami" "myami"{

provider = aws.region02

most_recent = true

owners = ["amazon"]

filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

}

resource "aws_instance" "myec2" {
  provider = aws.region02

  ami           = data.aws_ami.myami.id
  instance_type = "t2.large"



}


resource "aws_vpc" "sl-vpc" {
 provider = aws.region02
  cidr_block       = "0.0.0.0/16"
   tags = {
    Name = "sl-vpc"
  }
}








