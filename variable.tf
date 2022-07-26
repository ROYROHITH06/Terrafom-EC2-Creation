variable "ami" {
 default = "ami-033282affc22d0ae8"
 }

variable "instance_type" {
  default = "t2.micro"
 }

variable "aws_region" {
  default = "us-east-1"
 }

variable "subnet02_cidr" {
 default = "10.180.20.0/24"
}

variable "key_name" {
  description = "key name for the instance"
  default = "newpemkey"
 }

variable "volume_size" {
  default = "50"
}

