variable "region" {
   default = "us-east-1"
}

variable "vpc_cidr" {
   cidr_block = "10.0.0.0/16"
}


variable "vpc_name" {
   default = "my-vpc"
}