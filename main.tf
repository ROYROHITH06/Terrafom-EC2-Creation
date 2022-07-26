provider "aws" {
  region = "us-east-1"
 }

#Get a list of available zone in current region
data "aws_availability_zones" "all" {}

#Create Public subnet on the first available zone
resource "aws_subnet" "public_us_east_1" {
  vpc_id            = "vpc-00cc4a2a6875a2349"
  cidr_block        = var.subnet02_cidr
  availability_zone = data.aws_availability_zones.all.names[0]

 tags  = {
  name = "LSCP-PUBLIC-SUBNET-DEV-01"
 }
}

# Associate the Routetable to the Subnet
resource "aws_route_table_association" "my_vpc_ap_east_1a_public" {
 subnet_id  = aws_subnet.public_us_east_1.id
 route_table_id = "rtb-00a4d1a8a4666325d"
}

resource "aws_instance" "my_instance" {
  count          = 1
  ami            = var.ami
  instance_type  = var.instance_type
  key_name       = var.key_name
  vpc_security_group_ids = ["sg-02e8e738782c11c3c"]
  subnet_id      = aws_subnet.public_us_east_1.id
  associate_public_ip_address = true
  availability_zone = data.aws_availability_zones.all.names[0]
  root_block_device {
        delete_on_termination = "true"
        volume_type = "gp2"
        volume_size = "${var.volume_size}"
    }


  tags  = {
   Name  = "ENV-TERRAFORM-JENKINS"
  }
 }


