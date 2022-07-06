variable "ami" {
 default = "ami-0729e439b6769d6ab"
 }

variable "instance_type" {
  default = "t3.micro"
 }

variable "aws_region" {
  default = "us-east-1"
 }

variable "subnet02_cidr" {
 default = "10.180.3.0/24"
}

variable "key_name" {
  description = "key name for the instance"
  default = "newpemkey"
 }

variable "volume_size" {
  default = "30"
}

#variable "vpc_cidr" {
#  default = "10.180.0.0/16"
# }

